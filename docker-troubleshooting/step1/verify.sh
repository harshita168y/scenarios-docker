#!/bin/bash
sleep 3
[ "$(docker inspect -f '{{.State.Running}}' db 2>/dev/null)" = "true" ] || exit 1
docker inspect -f '{{range .Config.Env}}{{println .}}{{end}}' db | grep -q '^POSTGRES_PASSWORD=.\+' || exit 1
exit 0
