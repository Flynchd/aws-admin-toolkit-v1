
# ConfigureCloudWatchAlarms.ps1

# Script to set up CloudWatch alarms for monitoring specific metrics and triggering notifications

# Accept user input for the metric name
$metricName = Read-Host "Enter the metric name"

# Accept user input for the alarm threshold
$threshold = Read-Host "Enter the alarm threshold value"

# Accept user input for the alarm action
$alarmAction = Read-Host "Enter the alarm action"

# AWS CLI command to create a CloudWatch alarm
$awsCliCommand = "aws cloudwatch put-metric-alarm --alarm-name MyAlarm --alarm-description 'Alarm for $metricName' --metric-name $metricName --namespace AWS/EC2 --statistic Average --period 300 --threshold $threshold --comparison-operator GreaterThanThreshold --evaluation-periods 1 --alarm-actions $alarmAction"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
