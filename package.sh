#!/usr/bin/env sh
set -e

REGION="us-east-1"
ECR_URL="170686501827.dkr.ecr.us-east-1.amazonaws.com/httpd"
BUILD_NUMBER="${BUILD_NUMBER:-$CIRCLE_BUILD_NUM}"


echo "Building $BUILD_NUMBER" 

$(aws ecr get-login --no-include-email --region $REGION)
# build a docker image with a unique build number
docker build -t $ECR_URL:$BUILD_NUMBER \

  --build-arg VERSION="$BUILD_NUMBER" \
  .

# push to ecr
docker push $ECR_URL:$BUILD_NUMBER

#tag for "latest" and also push that
docker tag $ECR_URL:$BUILD_NUMBER $ECR_URL:latest
docker push $ECR_URL:latest
