class OauthSample
  headers = [
    'Accept: application/vnd.github.v3+json, application/json',
    'User-Agent: https://example-app.com/'
  ]
  githubClientID = '9ca3690ca1bf106f2829'
  
  githubClientSecret = '1f67ffd786bbe54666786ba7201a4e7a246d4fa3'
   
  # This is the URL we'll send the user to first
  # to get their authorization
  authorizeURL = 'https://github.com/login/oauth/authorize'
   
  # This is the endpoint we'll request an access token from
  tokenURL = 'https://github.com/login/oauth/access_token'
   
  # This is the Github base URL for API requests
  apiURLBase = 'https://api.github.com/'
   
  # The URL for this script, used as the redirect URL
  baseURL = 'https://localhost:3000/lists'
end