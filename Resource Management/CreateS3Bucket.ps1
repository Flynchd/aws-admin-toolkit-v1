# CreateS3Bucket.ps1

# Script to create an S3 bucket

$isValid = $false

do {
    # Prompt the user for the bucket name
    $bucketName = Read-Host "Enter the bucket name"

    # Validate the input
    if (-not [string]::IsNullOrWhiteSpace($bucketName)) {
        $isValid = $true
    }
    else {
        Write-Host "Invalid input. Please provide a valid bucket name."
    }
} while (-not $isValid)

# Create the S3 bucket using AWS CLI command
$awsCliCommand = "aws s3api create-bucket --bucket $bucketName"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
