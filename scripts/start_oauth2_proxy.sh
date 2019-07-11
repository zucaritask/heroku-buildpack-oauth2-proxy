#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

if [ -z ${PORT+x} ]; then echo "please set PORT"; exit 1; fi
if [ -z ${OAUTH2_PROXY_PROVIDER+x} ]; then echo "please set OAUTH2_PROXY_PROVIDER"; exit 1; fi
if [ -z ${OAUTH2_PROXY_CLIENT_ID+x} ]; then echo "please set OAUTH2_PROXY_CLIENT_ID"; exit 1; fi
if [ -z ${OAUTH2_PROXY_CLIENT_SECRET+x} ]; then echo "please set OAUTH2_PROXY_CLIENT_SECRET"; exit 1; fi
if [ -z ${OAUTH2_PROXY_COOKIE_SECRET+x} ]; then echo "please set OAUTH2_PROXY_COOKIE_SECRET"; exit 1; fi

OPTIONS=( )
if [ -n "${OAUTH2_EMAIL_DOMAIN}" ]; then
    for EMAIL_DOMAIN in $(echo "${OAUTH2_EMAIL_DOMAIN}" | tr ',' '\n'); do
        OPTIONS=( "${OPTIONS[@]}" "--email-domain=${EMAIL_DOMAIN}" )
    done
else
    OPTIONS=( "${OPTIONS[@]}" "--email-domain=*" )
fi

if [ -n "${OAUTH2_GITHUB_ORG}" ]; then
    OPTIONS=( "${OPTIONS[@]}" "--github-org=${OAUTH2_GITHUB_ORG}" )
fi

echo "starting oauth2_proxy..."
exec ./oauth2_proxy \
       --http-address=http://:$PORT \
       --provider="${OAUTH2_PROXY_PROVIDER}" \
       --set-xauthrequest=true \
       --pass-access-token=true \
       --upstream=http://127.0.0.1:8080 \
       "${OPTIONS[@]}"
