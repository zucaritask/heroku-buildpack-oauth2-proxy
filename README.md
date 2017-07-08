# heroku-buildpack-oauth2-proxy

Installs [oauth2_proxy](https://github.com/pallavkothari/oauth2_proxy) along with golang 1.8.3: 
```bash
heroku buildpacks:add https://github.com/pallavkothari/heroku-buildpack-oauth2-proxy
```

From your Procfile you can then run `oauth2_proxy` as usual (in addition to kicking off your own http backend on port 8080): 
```bash
/app/go/bin/oauth2_proxy \
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

