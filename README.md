# heroku-buildpack-oauth2-proxy

Installs [oauth2_proxy](https://github.com/pallavkothari/oauth2_proxy) along with golang 1.8.3: 
```bash
heroku buildpacks:add https://github.com/pallavkothari/heroku-buildpack-oauth2-proxy
```

## Starting on heroku 
This buildpack will generate a `start-oauth2-proxy.sh` script in the build directory. You simply need to call this script from your Procfile and start your http backend on port 8080. 

Note that the following environment variables are required: 

- PROVIDER (e.g. github, facebook, etc)
- OAUTH2_PROXY_CLIENT_ID
- OAUTH2_PROXY_CLIENT_SECRET
- OAUTH2_PROXY_COOKIE_SECRET
- APP (e.g. https://yourapp.herokuapp.com or localhost:4180)
- COOKIE_DOMAIN (e.g. yourapp.herokuapp.com)


## Starting manually

```bash
oauth2_proxy \
   --http-address=http://:$PORT \
   --email-domain="*"  \
   --cookie-secret="supersecret" \
   --provider="github" \
   --client-id=my-client-id \
   --client-secret=my-client-secret \
   --upstream=http://localhost:8080/ \
   --redirect-url=https://YOUR_HEROKU_APP/oauth2/callback \
   --cookie-domain=YOUR_DOMAIN \
   --cookie-secure=true \
   --set-xauthrequest=true \   
```

Obviously, this is just an example. See oauth2_proxy's README for more details.  
In particular, I recommend using environment variables whenever possible (e.g. cookie secret, client id, client secret)

