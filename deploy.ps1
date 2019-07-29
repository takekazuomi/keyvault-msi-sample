Param (
    [string]$Name,
    [string]$Location
)

$baseDir = (Split-Path -Parent $MyInvocation.MyCommand.Path)

New-AzResourceGroup -Name $Name -Location $Location -Force

New-AzResourceGroupDeployment -Name "$Name-$(Get-Date -f "ddHHmm")"  -ResourceGroupName $Name -TemplateFile "$baseDir\azuredeploy.json" `
    -webSiteName "$Name-web" `
    -keyVaultName "$Name-kv" `
    -keyVaultSecret "secretsone" 
