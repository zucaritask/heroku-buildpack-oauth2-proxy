# heroku-buildpack-oauth2-proxy

Installs [oauth2_proxy](https://github.com/pallavkothari/oauth2_proxy) along with golang 1.8.3  

From your Procfile you can then run `oauth2_proxy` as usual. See that project's README for more details. 

Example: 
```
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

