#Variables de entorno
RESULT=$(aws ecs register-task-definition --family $AWS_TASK_DEFINITION --network-mode awsvpc --task-role-arn $AWS_TASK_ROLE_ARN --execution-role-arn $AWS_EXECUTION_ROLE_ARN --cpu $AWS_CPU --memory $AWS_MEMORY --requires-compatibilities "$AWS_REQUIRES_COMPATIBILITIES" --container-definitions '[{"name":"'"$AWS_NAME_CONTAINER"'","image":"'"$AWS_IMAGE"'","portMappings":[{"containerPort": '"$AWS_CONTAINER_PORT"',"hostPort": '"$AWS_HOST_PORT"',"protocol": "tcp"}],
"logConfiguration": {"logDriver": "awslogs","options":{"awslogs-group":"/ecs/'"$AWS_TASK_DEFINITION"'","awslogs-region": "'"$AWS_ZONA"'","awslogs-stream-prefix": "ecs"}}}]')
echo 'resultado:' $RESULT

JSON_RESULT=$(echo $RESULT | jq .)
ARN_TASKDEFINITION_RAW=$(echo $JSON_RESULT | jq .taskDefinition.taskDefinitionArn)
ARN_TASKDEFINITION=$(echo $ARN_TASKDEFINITION_RAW | sed 's/"//g')


LISTA_SERVICIO=$(aws ecs list-services --cluster $AWS_CLUSTER)
if echo ${LISTA_SERVICIO[@]} | grep -q -w "$AWS_SERVICE_NAME"; then
	echo "Existe, servicio actualizado"
	aws ecs update-service --service $AWS_SERVICE_NAME --cluster $AWS_CLUSTER --task-definition $ARN_TASKDEFINITION
else
	echo "Nuevo servicio"
	aws ecs create-service --cluster $AWS_CLUSTER --service-name $AWS_SERVICE_NAME --launch-type FARGATE --task-definition $ARN_TASKDEFINITION --desired-count $AWS_NUMBER_TASK --deployment-configuration '{"maximumPercent":200,"minimumHealthyPercent":100}' --network-configuration '{"awsvpcConfiguration":{"subnets":['"$AWS_SUBNET_PRIVATE"'],"securityGroups":["'"$SECURITY_GROUP_ID"'"],"assignPublicIp":"DISABLED"}}' --load-balancers '[{"targetGroupArn":"'"$ARN_TARGET_GROUP"'","containerName":"'"$AWS_NAME_CONTAINER"'","containerPort":'"$AWS_CONTAINER_PORT"'}]'
fi