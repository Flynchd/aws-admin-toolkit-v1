# ScriptAWSCLICommands.ps1

# Script to execute custom AWS CLI commands

# Accept user input for the AWS CLI command
$awsCliCommand = Read-Host "Enter the AWS CLI command"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
