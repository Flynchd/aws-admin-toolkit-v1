# PowerShell Menu Screen

function Show-Menu {
    Clear-Host
    Write-Host "AWS Admin Toolkit Menu"
    Write-Host "-----------------------"
    Write-Host "1. Resource Management"
    Write-Host "2. Monitoring and Logging"
    Write-Host "3. Security and Compliance"
    Write-Host "4. Automation and Scripting"
    Write-Host "5. Cost Optimization"
    Write-Host "6. Integration and Extensibility"
    Write-Host "Q. Quit"
    Write-Host ""
}

function ResourceManagement {
    # Code to execute Resource Management tasks
    Write-Host "Executing Resource Management tasks..."
    Start-Sleep -Seconds 2
    # Run the appropriate script for Resource Management tasks
    .\CreateEC2Instance.ps1
    .\CreateS3Bucket.ps1
    .\CreateIAMUser.ps1
    Start-Sleep -Seconds 5
}

function MonitoringAndLogging {
    # Code to execute Monitoring and Logging tasks
    Write-Host "Executing Monitoring and Logging tasks..."
    Start-Sleep -Seconds 2
    # Run the appropriate script for Monitoring and Logging tasks
    .\EnableCloudWatchLogs.ps1
    .\ConfigureCloudWatchAlarms.ps1
    .\CreateCloudWatchDashboard.ps1
    Start-Sleep -Seconds 5
}

function SecurityAndCompliance {
    # Code to execute Security and Compliance tasks
    Write-Host "Executing Security and Compliance tasks..."
    Start-Sleep -Seconds 2
    # Run the appropriate script for Security and Compliance tasks
    .\ConfigureAWSConfigRules.ps1
    .\EnableAWSCloudTrail.ps1
    .\ApplyIAMBestPractices.ps1
    Start-Sleep -Seconds 5
}

function AutomationAndScripting {
    # Code to execute Automation and Scripting tasks
    Write-Host "Executing Automation and Scripting tasks..."
    Start-Sleep -Seconds 2
    # Run the appropriate script for Automation and Scripting tasks
    .\AutomateEC2StartStop.ps1
    .\AutomateEBSSnapshotCreation.ps1
    .\ScriptAWSCLICommands.ps1
    Start-Sleep -Seconds 5
}

function CostOptimization {
    # Code to execute Cost Optimization tasks
    Write-Host "Executing Cost Optimization tasks..."
    Start-Sleep -Seconds 2
    # Run the appropriate script for Cost Optimization tasks
    .\TerminateIdleEC2Instances.ps1
    .\AnalyzeEC2InstanceUtilization.ps1
    .\AutomateReservedInstancePurchases.ps1
    Start-Sleep -Seconds 5
}

function IntegrationAndExtensibility {
    # Code to execute Integration and Extensibility tasks
    Write-Host "Executing Integration and Extensibility tasks..."
    Start-Sleep -Seconds 2
    # Run the appropriate script for Integration and Extensibility tasks
    .\IntegrateWithAWSLambda.ps1
    .\IntegrateWithAWSStepFunctions.ps1
    .\CustomAPIIntegration.ps1
    Start-Sleep -Seconds 5
}

do {
    Show-Menu
    $input = Read-Host "Enter your choice"
    switch ($input) {
        '1' { ResourceManagement }
        '2' { MonitoringAndLogging }
        '3' { SecurityAndCompliance }
        '4' { AutomationAndScripting }
        '5' { CostOptimization }
        '6' { IntegrationAndExtensibility }
        'Q' { break }
        default { Write-Host "Invalid input. Please try again." }
    }
} while ($input -ne 'Q')
