#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://e801efe8.ngrok.io/project/5ded93820ce687f0c9c4444c/webhook/build/pull > /dev/null
if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://e801efe8.ngrok.io/pull/5ded93820ce687f0c9c4444c 
fi
curl -s -X POST https://e801efe8.ngrok.io/project/5ded93820ce687f0c9c4444c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://e801efe8.ngrok.io/project/5ded93820ce687f0c9c4444c/webhook/build/publish > /dev/null
