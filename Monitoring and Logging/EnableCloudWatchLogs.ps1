# EnableCloudWatchLogs.ps1

# Script to enable CloudWatch Logs for EC2 instances or other AWS services

# Prompt the user for the instance ID
do {
    $instanceId = Read-Host "Enter the EC2 instance ID"
} while ([string]::IsNullOrWhiteSpace($instanceId))

# Prompt the user for the log group name
do {
    $logGroupName = Read-Host "Enter the log group name"
} while ([string]::IsNullOrWhiteSpace($logGroupName))

# AWS CLI command to enable CloudWatch Logs for the instance
$awsCliCommand = "aws logs create-log-stream --log-group-name $logGroupName --log-stream-name $instanceId"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
