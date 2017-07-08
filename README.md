# heroku-buildpack-oauth2-proxy

Installs [oauth2_proxy](https://github.com/pallavkothari/oauth2_proxy) along with golang 1.8.3: 
```bash
heroku buildpacks:add https://github.com/pallavkothari/heroku-buildpack-oauth2-proxy
```

From your Procfile you can then run `oauth2_proxy` as usual (in addition to kicking off your own http backend on port 8080): 
```bash
oauth2_proxy \
   --email-domain="*"  \
   --cookie-secret="supersecret" \
   --provider="github" \
   --client-id=my-client-id \
   --client-secret=my-client-secret \
   --upstream=http://localhost:8080/ \
   --redirect-url=http://localhost:4180/oauth2/callback \
   --cookie-domain=localhost \
   --cookie-secure=true \
```

See oauth2_proxy's README for more details.
