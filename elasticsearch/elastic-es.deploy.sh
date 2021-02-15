#!/bin/bash
STACK_NAME=elastic-es

if ! aws cloudformation describe-stacks --stack-name $STACK_NAME > /dev/null 2>&1; then
    aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://elastic-es.yaml --parameters file://elastic-es.params.json --capabilities CAPABILITY_IAM
else
    aws cloudformation update-stack --stack-name $STACK_NAME --template-body file://elastic-es.yaml --parameters file://elastic-es.params.json --capabilities CAPABILITY_IAM
fi