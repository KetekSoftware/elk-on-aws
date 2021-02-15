#!/bin/bash
AWS_ACCOUNT_ID=THE_AWS_ACCOUNT_ID
AWS_DEFAULT_REGION=us-west-2
REPO_NAME=elastic/es
ES_VERSION=7.10.0
ES_VERSION_TAG=7.10.0
eval $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email | sed 's|https://||')
docker build --build-arg ES_VERSION=$ES_VERSION -t $REPO_NAME:$ES_VERSION_TAG .
docker tag $REPO_NAME:$ES_VERSION_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$REPO_NAME:$ES_VERSION_TAG
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$REPO_NAME:$ES_VERSION_TAG