#!/bin/bash

set -e

echo "$PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

cd /data

if [[ -z "$(ls)" ]]; then
	git clone --mirror "$ORIGIN" .
else
	git fetch
fi

git push --all "$MIRROR"
git push --tags "$MIRROR"
