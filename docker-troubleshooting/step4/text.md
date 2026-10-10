# Step 4: Killed by the OOM killer

The `memhog` container processes a data blob, but it never finishes:

```
docker ps -a --filter name=memhog
```{{exec}}

Exit code **137** means the process received SIGKILL. Find out whether memory was the cause:

```
docker inspect memhog --format 'OOMKilled={{.State.OOMKilled}} ExitCode={{.State.ExitCode}} Limit={{.HostConfig.Memory}}'
```{{exec}}

**Task:** the job needs roughly 100 MB of memory. Re-run it as `memhog` with a sensible limit (at least `128m`) so it completes with exit code **0** and is **not** OOM killed.

Use this command as the base:

```
docker run -d --name memhog --memory <LIMIT> busybox sh -c 'head -c 100000000 /dev/zero | tail -c 1'
```

<details>
<summary>Hint</summary>

Remove the old container first (`docker rm memhog`), then run it with e.g. `--memory 256m`. Use `docker stats --no-stream` on a running container to observe real usage.

</details>
