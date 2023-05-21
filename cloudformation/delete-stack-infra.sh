#!/bin/bash
STACK_NAME=awsbootstrap-dev
REGION=eu-central-1
CLI_PROFILE=awsbootstrap
EC2_INSTANCE_TYPE=t2.micro

# Deploy the CloudFormation template
echo -e "\n\n=========== Deploying main.yml ==========="
aws cloudformation delete-stack \
    --region $REGION \
    --profile $CLI_PROFILE \
    --stack-name $STACK_NAME

