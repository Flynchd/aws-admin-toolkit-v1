# CreateEC2Instance.ps1

# Script to provision EC2 instances with specified parameters

# AWS CLI command to create an EC2 instance
$awsCliCommand = "aws ec2 run-instances --image-id <IMAGE_ID> --instance-type <INSTANCE_TYPE> --key-name <KEY_PAIR_NAME> --security-group-ids <SECURITY_GROUP_ID> --subnet-id <SUBNET_ID>"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
