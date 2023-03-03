


clear




#Create Resource Group in Azure
#$suffix = 'didharch1983';
$suffix = Read-Host -Prompt " `nPlease enter an unique suffix for your environment "
$rgName = 'RGSynapseLab' + $suffix
Write-Host 'Deleting Resource Group '"'$rgName'"' for the Lab in Azure...' -ForegroundColor Green
""
$rg = Remove-AzResourceGroup -Name $rgName

