# CreateIAMUser.ps1

# Script to create an IAM user

$isValid = $false

do {
    # Prompt the user for the username
    $username = Read-Host "Enter the username"

    # Validate the input
    if (-not [string]::IsNullOrWhiteSpace($username)) {
        $isValid = $true
    }
    else {
        Write-Host "Invalid input. Please provide a valid username."
    }
} while (-not $isValid)

# Create the IAM user using AWS CLI command
$awsCliCommand = "aws iam create-user --user-name $username"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
