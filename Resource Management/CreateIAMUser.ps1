
# CreateIAMUser.ps1

# Script to create an IAM user with specific permissions and access keys

# AWS CLI command to create an IAM user
$awsCliCommand = "aws iam create-user --user-name <USER_NAME>"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand

# AWS CLI command to create access keys for the IAM user
$awsCliCommand = "aws iam create-access-key --user-name <USER_NAME>"

# Execute the AWS CLI command
$accessKeyOutput = Invoke-Expression $awsCliCommand

# Display the access key details
$accessKeyOutput | ConvertFrom-Json | Select-Object -ExpandProperty AccessKey
