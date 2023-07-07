
# AnalyzeEC2InstanceUtilization.ps1

# Script to analyze EC2 instance utilization metrics and recommend appropriate instance types for better cost optimization

# Accept user input for the instance ID
$instanceId = Read-Host "Enter the EC2 instance ID"

# AWS CLI command to get the EC2 instance metrics
$awsCliCommand = "aws cloudwatch get-metric-statistics --namespace AWS/EC2 --metric-name CPUUtilization --dimensions Name=InstanceId,Value=$instanceId --statistics Average --start-time (Get-Date).AddDays(-7) --end-time (Get-Date) --period 86400"

# Execute the AWS CLI command and get the output
$metricsOutput = Invoke-Expression $awsCliCommand

if ($metricsOutput.Datapoints.Count -gt 0) {
    # Calculate the average CPU utilization
    $averageUtilization = $metricsOutput.Datapoints | Measure-Object -Property Average -Average | Select-Object -ExpandProperty Average

    # Make recommendations based on average CPU utilization
    if ($averageUtilization -lt 30) {
        Write-Host "Recommendation: The instance is underutilized. Consider downsizing or stopping it."
    } elseif ($averageUtilization -gt 70) {
        Write-Host "Recommendation: The instance is highly utilized. Consider upsizing or optimizing it."
    } else {
        Write-Host "Recommendation: The instance utilization is within the desired range."
    }
} else {
    Write-Host "No metrics data found for the specified instance."
}
