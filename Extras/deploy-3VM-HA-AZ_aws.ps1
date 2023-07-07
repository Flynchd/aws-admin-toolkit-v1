# AWS Credentials
Set-AWSCredential -AccessKey 'your_access_key' -SecretKey 'your_secret_key' -StoreAs 'default'

# AWS Region
Set-DefaultAWSRegion -Region 'us-west-2'

# Launch Configuration
New-ASLaunchConfiguration -LaunchConfigurationName "my-launch-configuration" -ImageId "ami-0abcdef1234567890" -InstanceType "t2.micro" -KeyName "your_key_pair"

# Auto Scaling Group
New-ASAutoScalingGroup -AutoScalingGroupName "my-auto-scaling-group" -AvailabilityZone @( 'us-west-2a', 'us-west-2b', 'us-west-2c' ) -LaunchConfigurationName "my-launch-configuration" -MinSize 3 -MaxSize 3 -DesiredCapacity 3
