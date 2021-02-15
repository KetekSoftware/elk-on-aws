STACK_NAME=elastic-ecr

if ! aws cloudformation describe-stacks --stack-name $STACK_NAME > /dev/null 2>&1; then
    aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://elastic-ecr.yaml --parameters file://elastic-ecr.params.json
else
    aws cloudformation update-stack --stack-name $STACK_NAME --template-body file://elastic-ecr.yaml --parameters file://elastic-ecr.params.json
fi