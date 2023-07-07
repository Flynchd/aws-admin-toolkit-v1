# CreateS3Bucket.ps1

# Script to create an S3 bucket with specified configurations

# AWS CLI command to create an S3 bucket
$awsCliCommand = "aws s3api create-bucket --bucket <BUCKET_NAME> --region <REGION> --create-bucket-configuration LocationConstraint=<REGION>"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand

