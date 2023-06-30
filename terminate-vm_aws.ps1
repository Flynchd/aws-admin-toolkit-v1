# AWS CLI requires environment variables to authenticate. Replace with your own access key, secret key, and default region.
$env:AWS_ACCESS_KEY_ID='your_access_key'
$env:AWS_SECRET_ACCESS_KEY='your_secret_key'
$env:AWS_DEFAULT_REGION='us-west-2'  # choose your preferred region

# Define the instance id
$instanceId = "i-0abcd1234efgh5678"

# Define the command to terminate an EC2 instance
$awscli_command = "aws ec2 terminate-instances --instance-ids $instanceId"

# Run the AWS CLI command
& $awscli_command
