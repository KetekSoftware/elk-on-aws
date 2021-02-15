#!/bin/bash
AWS_ACCOUNT_ID=THE_AWS_ACCOUNT_ID
AWS_DEFAULT_REGION=us-west-2
REPO_NAME=elastic/kibana
KIBANA_VERSION=7.10.0
eval $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email | sed 's|https://||')
docker build --build-arg KIBANA_VERSION=$KIBANA_VERSION -t $REPO_NAME:$KIBANA_VERSION .
docker tag $REPO_NAME:$KIBANA_VERSION $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$REPO_NAME:$KIBANA_VERSION
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$REPO_NAME:$KIBANA_VERSION