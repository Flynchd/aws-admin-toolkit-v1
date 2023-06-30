# Define the URL for the AWS CLI installer
$InstallerUrl = "https://awscli.amazonaws.com/AWSCLIV2.msi"

# Define the path for the downloaded installer
$OutputInstallerPath = "$env:TEMP\AWSCLIV2.msi"

# Download the installer
Invoke-WebRequest -Uri $InstallerUrl -OutFile $OutputInstallerPath

# Install AWS CLI
Start-Process -FilePath msiexec.exe -ArgumentList "/i", "$OutputInstallerPath", "/qn", "/norestart" -Wait
