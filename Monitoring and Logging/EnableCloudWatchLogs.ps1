
# EnableCloudWatchLogs.ps1

# Script to enable CloudWatch Logs for EC2 instances or other AWS services

# Accept user input for the instance ID
$instanceId = Read-Host "Enter the EC2 instance ID"

# Accept user input for the log group name
$logGroupName = Read-Host "Enter the log group name"

# AWS CLI command to enable CloudWatch Logs for the instance
$awsCliCommand = "aws logs create-log-stream --log-group-name $logGroupName --log-stream-name $instanceId"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
