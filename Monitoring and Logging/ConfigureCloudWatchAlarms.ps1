# CreateCloudWatchDashboard.ps1

# Script to create a custom CloudWatch dashboard with the desired metrics

# Accept user input for the dashboard name
$dashboardName = Read-Host "Enter the dashboard name"

# Accept user input for the metric names (comma-separated)
$metricNames = Read-Host "Enter the metric names (comma-separated)"

# Convert the metric names to an array
$metricArray = $metricNames -split ","

# AWS CLI command to create a CloudWatch dashboard
$awsCliCommand = "aws cloudwatch put-dashboard --dashboard-name $dashboardName --dashboard-body '{""widgets"":["
$widgetCounter = 1

# Loop through each metric name and add it as a widget in the dashboard
foreach ($metric in $metricArray) {
    $awsCliCommand += "{""type"":""metric"",""x"":0,""y"":$widgetCounter,""width"":12,""height"":6,""properties"":{""metrics"":[[""AWS/EC2"",""$metric"",""InstanceId"",""i-1234567890abcdef0""]],""view"":""timeSeries"",""stacked"":false,""region"":""us-east-1"",""title"":""$metric""}},"
    $widgetCounter += 6
}

# Remove the trailing comma from the last widget
$awsCliCommand = $awsCliCommand.TrimEnd(",")

# Close the dashboard-body JSON structure
$awsCliCommand += "]}'"

# Execute the AWS CLI command
Invoke-Expression $awsCliCommand
