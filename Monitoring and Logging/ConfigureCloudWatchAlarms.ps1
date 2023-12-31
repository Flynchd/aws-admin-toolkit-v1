# ConfigureCloudWatchAlarms.ps1

# Script to set up CloudWatch alarms for monitoring specific metrics and triggering notifications

# Prompt the user for the metric name
do {
    $metricName = Read-Host "Enter the metric name"
} while ([string]::IsNullOrWhiteSpace($metricName))

# Prompt the user for the alarm threshold
do {
    $threshold = Read-Host "Enter the alarm threshold value"
} while (-not [double]::TryParse($threshold, [ref]$null))

# Prompt the user for the alarm action
do {
    $alarmAction = Read-Host "Enter the alarm action"
} while ([string]::IsNullOrWhiteSpace($alarmAction))

# AWS CLI command to create a CloudWatch alarm
$awsCliCommand = "aws cloudwatch put-metric-alarm --alarm-name MyAlarm --alarm-description 'Alarm for $metricName' --metric-name $metricName --namespace AWS/EC2 --statistic Average --period 300 --threshold $threshold --comparison-operator GreaterThanThreshold --evaluation-periods 1 --alarm-actions $alarmAction"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
