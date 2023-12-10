#!/bin/bash

######################################################
# Author: Amogh Kalashetty
# Version: V1
#
# This script will report the aws resource usage
######################################################

set -x

echo 'List of S3 buckets'

aws s3 ls

echo 'List of IAM users'

aws iam list-users | jq '.Users[].UserName'

echo 'List of EC2 instances'

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

echo 'Completed'
