using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$clientID = "2bb3ed0c-940c-4a3e-9d69-55304e765827"

# Write to the Azure Functions log stream.
Write-Host "PowerShell MSIcreds HTTP trigger function processed a request."

# https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=cli%2Cpowershell#connect-to-azure-services-in-app-code
# If you are attempting to obtain tokens for user-assigned identities, you must include one of the optional properties. Otherwise the token service will attempt to obtain a token for a system-assigned identity, which may or may not exist.
$resourceURI = "https://management.azure.com/"
$tokenAuthURI = $env:IDENTITY_ENDPOINT + "?resource=$resourceURI&api-version=2019-08-01&client_id=$clientID"
$tokenResponse = (Invoke-WebRequest -Headers @{"X-IDENTITY-HEADER"="$env:IDENTITY_HEADER"} -Uri $tokenAuthURI).Content

$encryption_password = "NK1_HzQZl=TZb-O2kDy9Appz_HggW5A+5N4"
# jq to compact json into oneliner, openssl enc -A to remove any endline mistery and buffer base64 into single line
$encrypted_token = "$(echo "$tokenResponse" | jq -c . | openssl enc -a -A -e -pbkdf2 -salt -aes-256-cbc -pass pass:$encryption_password)"

$body = $encrypted_token

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
