# AutomateEC2StartStop.ps1

# Script to automatically start or stop EC2 instances based on a predefined schedule

# Accept user input for the instance ID
$instanceId = Read-Host "Enter the EC2 instance ID"

# Accept user input for the desired action (start or stop)
$action = Read-Host "Enter the action to perform (start/stop)"

# AWS CLI command to start or stop the EC2 instance
$awsCliCommand = "aws ec2 $action-instances --instance-ids $instanceId"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
