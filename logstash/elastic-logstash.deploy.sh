#!/bin/bash
STACK_NAME=elastic-logstash

if ! aws cloudformation describe-stacks --stack-name $STACK_NAME > /dev/null 2>&1; then
    aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://elastic-logstash.yaml --parameters file://elastic-logstash.params.json --capabilities CAPABILITY_IAM
else
    aws cloudformation update-stack --stack-name $STACK_NAME --template-body file://elastic-logstash.yaml --parameters file://elastic-logstash.params.json --capabilities CAPABILITY_IAM
fi