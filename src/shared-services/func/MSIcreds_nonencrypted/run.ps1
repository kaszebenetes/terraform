using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# $clientID = "2bb3ed0c-940c-4a3e-9d69-55304e765827"

# Write to the Azure Functions log stream.
Write-Host "PowerShell MSIcreds_nonencrypted HTTP trigger function processed a request."

# https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=cli%2Cpowershell#connect-to-azure-services-in-app-code
# If you are attempting to obtain tokens for user-assigned identities, you must include one of the optional properties. Otherwise the token service will attempt to obtain a token for a system-assigned identity, which may or may not exist.
$resourceURI = "https://management.azure.com/"
$tokenAuthURI = $env:IDENTITY_ENDPOINT + "?resource=$resourceURI&api-version=2019-08-01&client_id=$clientID"
$tokenResponse = Invoke-RestMethod -Method Get -Headers @{"X-IDENTITY-HEADER"="$env:IDENTITY_HEADER"} -Uri $tokenAuthURI
$accessToken = $tokenResponse.access_token

# $body = $tokenResponse

$test1 = $Request.Query.clientID
$test2 = $Request.Query.resourceURI

# if (-not $name) {
#     $name = $Request.Body.Name
# }

$body = "This HTTP triggered, params test1=$test1, test2=$test2"


# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
