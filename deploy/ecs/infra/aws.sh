#!/bin/bash
aws iam create-role --role-name rol-task-$AWS_NAME_CONTAINER --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{"Sid": "","Effect": "Allow","Principal": {"Service": "ecs-tasks.amazonaws.com"},"Action": "sts:AssumeRole"}]}'

aws iam attach-role-policy --role-name rol-task-$AWS_NAME_CONTAINER --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

LIST_SECURITY_GROUP=$(aws ec2 describe-security-groups --filters '[{"Name":"vpc-id","Values":["'"$AWS_VPC_ID"'"]},{"Name":"group-name","Values":["'"$AWS_SECURITY_GROUP"'"]}]')

JSON_SECURITY_GROUP=$(echo $LIST_SECURITY_GROUP | jq .)
DESCRIBE_SECURITY_GROUP_ID=$(echo $JSON_SECURITY_GROUP | jq .SecurityGroups[0].GroupId)

if [ $DESCRIBE_SECURITY_GROUP_ID == 'null' ]; then
	GROUP_ID=$(aws ec2 create-security-group --group-name $AWS_SECURITY_GROUP --description $AWS_SECURITY_GROUP --vpc-id $AWS_VPC_ID)
	ARRAY_GROUP_ID=($GROUP_ID)
	PROPERTY_GROUP_ID=${ARRAY_GROUP_ID[2]}
	echo 'Nuevo ID del grupo' $PROPERTY_GROUP_ID
	SECURITY_GROUP_ID=$(echo $PROPERTY_GROUP_ID | sed 's/"//g')
	aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port $AWS_CONTAINER_PORT --cidr $AWS_SECURITY_GROUP_CIDR
else
    echo 'Existe ID del grupo:' $DESCRIBE_SECURITY_GROUP_ID
    SECURITY_GROUP_ID=$(echo $DESCRIBE_SECURITY_GROUP_ID | sed 's/"//g')
fi

RESULT_TARGET=$(aws elbv2 create-target-group --name $AWS_TARGET_GROUP --protocol TCP --port 80 --target-type ip --vpc-id $AWS_VPC_ID --health-check-protocol TCP --healthy-threshold-count 2 --unhealthy-threshold-count 2 --health-check-interval-seconds 10 --health-check-timeout-seconds 10)
JSON_RESULT_TARGET=$(echo $RESULT_TARGET | jq .)
ARN_TARGET_GROUP_RAW=$(echo $JSON_RESULT_TARGET | jq .TargetGroups[0].TargetGroupArn)
ARN_TARGET_GROUP=$(echo $ARN_TARGET_GROUP_RAW | sed 's/"//g')

aws elbv2 create-listener --load-balancer-arn $AWS_NLB_ARN --protocol TCP --port $AWS_PORT_TARGET_NLB --default-actions Type=forward,TargetGroupArn=$ARN_TARGET_GROUP_RAW

RESULT_LOG=$(aws logs describe-log-groups --log-group-name-prefix /ecs/$AWS_TASK_DEFINITION)
echo 'resultado_LOG:' $RESULT_LOG
RESULTARRAY_LOG=($RESULT_LOG)
echo 'resultado_ARRAY_LOG:' $RESULTARRAY_LOG
PROPERTIES_LOG=${RESULTARRAY_LOG[2]}
echo 'resultado_PROPERTIES_LOG:' $PROPERTIES_LOG

if [ $PROPERTIES_LOG == "[]" ]; then
	echo "Nuevo Group log"
	aws logs create-log-group --log-group-name /ecs/$AWS_TASK_DEFINITION
else
	echo "Existe Group Log"
fi
