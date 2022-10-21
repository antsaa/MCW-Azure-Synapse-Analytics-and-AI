$rgName = 'hsf-synapse-demo2'
$rg = new-azresourcegroup $rgName -location 'west europe'

$suffix = 'hsf';
#$sqlPassword = Read-Host -Prompt "Enter the SQL Administrator password you used in the deployment" -AsSecureString
$sqlPassword = 'P@ssw0rd1234!!'|ConvertTo-SecureString -AsPlainText -force
$sqlPassword1 = [System.Runtime.InteropServices.Marshal]::PtrToStringUni([System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($sqlPassword))
$uri = 'https://raw.githubusercontent.com/microsoft/MCW-Azure-Synapse-Analytics-and-AI/main/Hands-on%20lab/environment-setup/automation/00-asa-workspace-core.json'

$deployment = New-AzResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateUri $uri -uniqueSuffix $suffix -sqlAdministratorLoginPassword $sqlPassword
./01-environment-setup.ps1 -resourceGroupName $rg.ResourceGroupName -SQLPassword $sqlPassword1 -suffix $suffix
