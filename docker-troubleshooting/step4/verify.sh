#!/bin/bash
sleep 3
[ "$(docker inspect -f '{{.State.Status}}' memhog 2>/dev/null)" = "exited" ] || exit 1
[ "$(docker inspect -f '{{.State.ExitCode}}' memhog)" = "0" ] || exit 1
[ "$(docker inspect -f '{{.State.OOMKilled}}' memhog)" = "false" ] || exit 1
[ "$(docker inspect -f '{{.HostConfig.Memory}}' memhog)" -ge 134217728 ]
