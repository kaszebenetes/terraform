using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
    $name = $Request.Body.Name
}

# Install-Module -Name Az -AllowClobber -Scope CurrentUser
# Import-Module Az
# Import-Module Az.Accounts -Force
# Connect-AzAccount -Identity

# Connect-AzAccount

# Set-AzContext -Subscription "ac976d29-ee84-45b9-b0e3-8e4597f643ee"
# $StorageAccount = Get-AzStorageAccount -ResourceGroupName rg-contoso -Name stcontoso

# rm -rfv commands logs telemetry telemetry.txt versionCheck.json commandIndex.json az.json az.sess az_survey.json

# cfbfdac1375f:~/.azure# ls -l
# total 24
# -rw-r--r--    1 root     root           465 Aug  6 14:19 azureProfile.json
# -rw-r--r--    1 root     root            66 Aug  6 14:19 clouds.config
# -rw-------    1 root     root            63 Aug  6 14:19 config
# -rw-r--r--    1 root     root          9632 Aug  6 14:19 msal_http_cache.bin

# rm -rfv .azure/
# az config set core.encrypt_token_cache=false
# az login --identity
# az group list -o tsv --verbose --debug

# python3 -m http.server

# docker run -it mcr.microsoft.com/azure-cli
# https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-use-vm-token

# curl 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.core.windows.net/' -H Metadata:true

# curl 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.core.windows.net/' -H Metadata:true | jq .

# http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/
# http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fdatalake.azure.net%2F
# $subid = $(curl 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/' -H Metadata:true)

# $subid = (Get-AzSubscription).Id

# http://0.0.0.0:7071/MSI/token?resource=https://vault.azure.net&api-version=2017-09-01

$subid = $(curl 'http://0.0.0.0:7071/MSI/token?resource=https://vault.azure.net&api-version=2017-09-01' -H Metadata:true)


$resourceURI = "https://management.azure.com/"
$tokenAuthURI = $env:IDENTITY_ENDPOINT + "?resource=$resourceURI&api-version=2019-08-01&client_id=2bb3ed0c-940c-4a3e-9d69-55304e765827"
$tokenResponse = Invoke-RestMethod -Method Get -Headers @{"X-IDENTITY-HEADER"="$env:IDENTITY_HEADER"} -Uri $tokenAuthURI
$accessToken = $tokenResponse.access_token

$body = "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response. $tokenResponse. $subid............. $(echo $PATH) .......... ............. $(echo) .............. $(echo) ............ $(mount -a) ............. $(/home/.local/bin/az login --identity) ............ $(/home/.local/bin/az --version)"

# $body = $tokenResponse

# $body = "$(az vm list -o tsv)"

# apt list --installed
# dpkg --get-selections
# /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# pip install --no-dependencies azure-cli==2.40.0 && pip install azure-cli-core azure-common azure-mgmt-compute azure-mgmt-monitor azure-mgmt-resource semver


if ($name) {
    $body = "Hello, $name. This HTTP triggered function executed successfully."
}


# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
