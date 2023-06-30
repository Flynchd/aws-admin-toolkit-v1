# AWS CLI requires environment variables to authenticate. Replace with your own access key, secret key, and default region.
$env:AWS_ACCESS_KEY_ID='your_access_key'
$env:AWS_SECRET_ACCESS_KEY='your_secret_key'
$env:AWS_DEFAULT_REGION='us-west-2'  # choose your preferred region

# Define the command to create an EC2 instance
$awscli_command = 'aws ec2 run-instances --image-id ami-0abcdef1234567890 --count 1 --instance-type t2.micro --key-name my-key-pair --security-group-ids sg-01234abcd56789efg --subnet-id subnet-0123abcd4e56789f0'

# Run the AWS CLI command
& $awscli_command
