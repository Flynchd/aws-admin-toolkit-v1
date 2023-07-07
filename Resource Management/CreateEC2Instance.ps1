# CreateEC2Instance.ps1

# Script to create an EC2 instance

$isValid = $false

do {
    # Prompt the user for the instance name
    $instanceName = Read-Host "Enter the instance name"

    # Prompt the user for the instance type
    $instanceType = Read-Host "Enter the instance type"

    # Prompt the user for the security group
    $securityGroup = Read-Host "Enter the security group"

    # Prompt the user for the AMI ID
    $amiId = Read-Host "Enter the AMI ID"

    # Prompt the user for the key pair name
    $keyPair = Read-Host "Enter the key pair name"

    # Prompt the user for the subnet ID
    $subnetId = Read-Host "Enter the subnet ID"

    # Validate the inputs
    if (-not [string]::IsNullOrWhiteSpace($instanceName) -and
        -not [string]::IsNullOrWhiteSpace($instanceType) -and
        -not [string]::IsNullOrWhiteSpace($securityGroup) -and
        -not [string]::IsNullOrWhiteSpace($amiId) -and
        -not [string]::IsNullOrWhiteSpace($keyPair) -and
        -not [string]::IsNullOrWhiteSpace($subnetId))
    {
        $isValid = $true
    }
    else {
        Write-Host "Invalid inputs. Please provide all the required information."
    }
} while (-not $isValid)

# Create the EC2 instance using AWS CLI command
$awsCliCommand = "aws ec2 run-instances --image-id $amiId --instance-type $instanceType --key-name $keyPair --security-group-ids $securityGroup --subnet-id $subnetId --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$instanceName}]'"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
