$siteCollection = "https://fisandmedev.sharepoint.com"
$AppTitle = "Application Extension - Deployment of custom action."
$AppName = "clarity-client-side-solution"
$location = "ClientSideExtension.ApplicationCustomizer"
$componentId = "7f8fd1f2-9d26-4a4a-a607-bf4622d7ec11"
$componentProps = "{`"clarityID`":`"bdvw68wn0o`"}"


Connect-PnPOnline -Url $SiteCollection -Interactive


Get-PnPCustomAction -Scope Site

Add-PnPCustomAction -Title $AppTitle -Name $AppName -Location $location -ClientSideComponentId $componentId -ClientSideComponentProperties $componentProps -Scope Site

$Action = Get-PnPCustomAction -Scope Site | Where-Object {$_.Name -eq $AppName}
$Action | Select-Object *
#Remove-PnPCustomAction -Identity $Action

Disconnect-PnPOnline