# AutomateReservedInstancePurchases.ps1

# Script to automate the purchase of Reserved Instances based on usage patterns and cost savings

# Accept user input for the instance type
$instanceType = Read-Host "Enter the instance type"

# Accept user input for the offering class (Standard, Convertible)
$offeringClass = Read-Host "Enter the offering class (Standard/Convertible)"

# Accept user input for the term (1 or 3 years)
do {
    $term = Read-Host "Enter the term (1/3)"
    if ($term -ne "1" -and $term -ne "3") {
        Write-Host "Invalid input. Please enter either 1 or 3."
    }
} until ($term -eq "1" -or $term -eq "3")

# AWS CLI command to purchase the Reserved Instance
$awsCliCommand = "aws ec2 purchase-reserved-instances-offering --instance-count 1 --instance-type $instanceType --offering-class $offeringClass --offering-duration $term --offering-type HeavyUtilization --dry-run"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
