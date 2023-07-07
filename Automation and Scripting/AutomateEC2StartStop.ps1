# AutomateEBSSnapshotCreation.ps1

# Script to automate the creation of EBS snapshots for backup purposes

# Accept user input for the volume ID
$volumeId = Read-Host "Enter the EBS volume ID"

# Accept user input for the snapshot description
$description = Read-Host "Enter the snapshot description"

# AWS CLI command to create an EBS snapshot
$awsCliCommand = "aws ec2 create-snapshot --volume-id $volumeId --description $description"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
