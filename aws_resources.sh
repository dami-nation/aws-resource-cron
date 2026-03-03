#!/bin/bash

############################################

# Author: Damilola Ola

# Date: 03/02/2026

# Version: V1

# This script will report AWS resource usage

###########################################


PROOF="/Users/damiola/IdeaProjects/Projects/aws-resource-script/cron_proof.log"
echo "CRON HIT: $(date) pid=$$" >> "$PROOF"

# Show execution time
echo "========================================"
echo "Run at: $(date)"
echo "========================================"

# AWS s3
# AWS EC2
#AWS Lambda
#AWS IAM Users

# Use default aws profile
export AWS_PROFILE=default


# list s3 buckets
echo "Print list of ec2 buckets"
/opt/homebrew/bin/aws s3 ls

# list EC2 Instances
echo "Print list of ec2 buckets"
/opt/homebrew/bin/aws ec2 describe-instances | /usr/bin/jq '.Reservations[].Instances[].InstanceId'

#list lambda
echo "Print list of lambda functions"
/opt/homebrew/bin/aws lambda list-functions

#list IAM users
echo "Print list of IAM Users"
/opt/homebrew/bin/aws iam list-users
