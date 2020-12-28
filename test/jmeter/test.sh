#!/bin/bash

export TARGET_HOST="api-dev.utpxpedition.com"
export TARGET_PORT="80"
export TARGET_PATH="/user/users/getusers"
export TARGET_KEYWORD="demouser"

T_DIR=tests/trivial

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

./run.sh -Dlog_level.jmeter=DEBUG \
	-JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT} \
	-JTARGET_PATH=${TARGET_PATH} -JTARGET_KEYWORD=${TARGET_KEYWORD} \
	-n -t ${T_DIR}/test-plan.jmx -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat ${T_DIR}/jmeter.log

echo "==== Raw Test Report ===="
cat ${T_DIR}/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"
