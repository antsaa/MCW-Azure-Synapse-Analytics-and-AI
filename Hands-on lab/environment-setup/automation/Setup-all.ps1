<# NOT REQUIRED FOR AZURE CLI

#Install-Module Az.Accounts
#Import-Module Az.Resources


Clear-AzContext -Force
Connect-AzAccount


## User Details
$Account = Get-AzContext


# Select Subscription
Start-Process "https://ms.portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade"
$subscriptionID = Read-Host -Prompt "PLEASE ENTER Your SUBSCRIPTION ID "
if ([string]::IsNullOrWhiteSpace($subscriptionID))
{
    #$subscriptionID = 'Microsoft Azure Internal Consumption'
    Write-Error -Message ('*** ERROR: Subscription ID was not provided!!!!')
    ""
    break


}

""
Write-Host "Setting chosen Azure Subscription... `n" -ForegroundColor Green
Set-AzContext -Subscription $subscriptionID


$title    = 'Confirmation Required!!'
$question = 'Did you download the "SynapseLab" folder and have copied it locally? For example to "C:\Temp\" ?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

if ($decision -eq 0) {
    Write-Host " `nUser Confirmation received! Starting Script Execution..." -ForegroundColor Green
} else {
    Write-Host " `nUser has Cancelled, exiting!!" -ForegroundColor Red
    break
}

#> 


clear




#Create Resource Group in Azure
#$suffix = 'didharch1983';
$suffix = Read-Host -Prompt " `nPlease enter an unique suffix for your environment "
$rgName = 'RGSynapseLab' + $suffix
Write-Host 'Creating Resource Group '"'$rgName'"' for the Lab in Azure...' -ForegroundColor Green
""
$rg = new-azresourcegroup $rgName -location 'west europe'


#Synapse SQL Pool Password
""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "Note: Synapse SQL Pool Password requirements are as follows: "  -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "(1) Your password must be between 8 and 128 characters long." -ForegroundColor Brown
Write-Host "(2) Your password must contain characters from three of the following categories: 
                `nEnglish uppercase letters, 
                `nEnglish lowercase letters, 
                `nnumbers (0-9), 
                `nand non-alphanumeric characters (!, $, #, %, etc.)." -ForegroundColor Brown
Write-Host "(3) Your password cannot contain all or part of the login name. Part of a login name is defined as three or more consecutive alphanumeric characters." -ForegroundColor Brown
""
$sqlPassword = Read-Host -Prompt " `nEnter the Synapse SQL Pool Administrator password, please remember the same for the Labs " -AsSecureString
$sqlPassword1 = [System.Runtime.InteropServices.Marshal]::PtrToStringUni([System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($sqlPassword))


""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "DEPLOYING RESOURCES IN AZURE....PLEASE BE PATIENT... "  -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan


$uri = 'https://raw.githubusercontent.com/dibakardharchoudhury/MCW-Azure-Synapse-Analytics-and-AI/main/Hands-on%20lab/environment-setup/automation/00-asa-workspace-core.json'
#$deployment = New-AzResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateUri $uri -uniqueSuffix $suffix -sqlAdministratorLoginPassword $sqlPassword
New-AzResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateUri $uri -uniqueSuffix $suffix -sqlAdministratorLoginPassword $sqlPassword

""
""

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "SETTING UP ENVIRONMENT & COPYING DATA....PLEASE BE PATIENT... "  -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan

./01-environment-setup.ps1 -resourceGroupName $rg.ResourceGroupName -SQLPassword $sqlPassword1 -suffix $suffix

