#!/bin/bash
cd /root/broken-app || exit 1
docker image inspect broken-app >/dev/null 2>&1 || exit 1
docker run --rm broken-app 2>&1 | grep -q "app is healthy"
