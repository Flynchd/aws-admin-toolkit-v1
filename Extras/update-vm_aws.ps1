# AWS CLI requires environment variables to authenticate. Replace with your own access key, secret key, and default region.
$env:AWS_ACCESS_KEY_ID='your_access_key'
$env:AWS_SECRET_ACCESS_KEY='your_secret_key'
$env:AWS_DEFAULT_REGION='us-west-2'  # choose your preferred region

# Define the instance id
$instanceId = "i-0abcd1234efgh5678"

# Stop the instance
$awscli_command_stop = "aws ec2 stop-instances --instance-ids $instanceId"
& $awscli_command_stop

# Wait for the instance to stop
Start-Sleep -Seconds 60

# Modify the instance type
$awscli_command_modify = "aws ec2 modify-instance-attribute --instance-id $instanceId --instance-type t2.medium"
& $awscli_command_modify

# Start the instance
$awscli_command_start = "aws ec2 start-instances --instance-ids $instanceId"
& $awscli_command_start
