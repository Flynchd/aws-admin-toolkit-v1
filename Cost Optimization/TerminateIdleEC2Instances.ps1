# TerminateIdleEC2Instances.ps1

# Script to identify and terminate EC2 instances that have been idle for a specific period

do {
    # Accept user input for the idle threshold (in minutes)
    $idleThreshold = Read-Host "Enter the idle threshold (in minutes)"

    if (-not [int]::TryParse($idleThreshold, [ref]$null)) {
        Write-Host "Invalid input. Please enter a valid number."
    }
} until ([int]::TryParse($idleThreshold, [ref]$null))

# AWS CLI command to list EC2 instances
$awsCliCommand = "aws ec2 describe-instances"

# Execute the AWS CLI command and get the output
$instancesOutput = Invoke-Expression $awsCliCommand

# Iterate over the instances and terminate those that have been idle
foreach ($reservation in $instancesOutput.Reservations) {
    foreach ($instance in $reservation.Instances) {
        # Calculate the time delta between now and the launch time
        $launchTime = [datetime]$instance.LaunchTime
        $idleTime = New-TimeSpan -Start $launchTime -End (Get-Date)

        if ($idleTime.TotalMinutes -ge $idleThreshold) {
            $instanceId = $instance.InstanceId
            Write-Host "Terminating idle EC2 instance: $instanceId"
            # Terminate the instance
            $terminateCommand = "aws ec2 terminate-instances --instance-ids $instanceId"
            Invoke-Expression $terminateCommand
        }
    }
}

