"""
    sas_token(collection_id::AbstractString) -> (token::String, expiry::String)

Request a Shared Access Signature (SAS) Token to authorize requests to Azure Blob Storage.
Returns the token string, which can be added as query parameters to the URI, and the expiry
time of the token in UTC.
"""
function sas_token(collection_id::AbstractString)::Tuple{String, String}
    uri = string("https://planetarycomputer.microsoft.com/api/sas/v1/token/", collection_id)
    response = HTTP.get(uri)
    json = JSON3.read(response.body)
    token = json[:token]
    expiry = json[Symbol("msft:expiry")]
    return token, expiry
end

"Take the URI of a STAC.Asset and add the token to it as query parameters."
function signed_uri(asset::STAC.Asset, token::AbstractString)
    base_url = href(asset)
    return string(base_url, '?', token)
end
