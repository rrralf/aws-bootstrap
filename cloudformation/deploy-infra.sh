#!/bin/bash
STACK_NAME=awsbootstrap-dev
REGION=eu-central-1
CLI_PROFILE=awsbootstrap
EC2_INSTANCE_TYPE=t2.micro
CF_SCRIPT=stack-full-custom.yml

# Deploy the CloudFormation template
echo -e "\n\n=========== Deploying stack $STACK_NAME using $CF_SCRIPT ==========="
aws cloudformation deploy \
    --region $REGION \
    --profile $CLI_PROFILE \
    --stack-name $STACK_NAME \
    --template-file $CF_SCRIPT \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides \
    EC2InstanceType=$EC2_INSTANCE_TYPE

# # If the deploy succeeded, show the DNS name of the created instance
# if [ $? -eq 0 ]; then
#     aws cloudformation list-exports \
#         --profile awsbootstrap \
#         --query "Exports[?Name=='InstanceEndpoint'].Value"
# fi
