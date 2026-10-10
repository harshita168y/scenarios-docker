# The container that keeps exiting

## Instructions

A Postgres container named `db` was started, but it is not running.

Find out why `db` stopped, then end up with a **running** container named `db`.

Start by listing all containers, including stopped ones:

```
docker ps -a
```{{exec}}

## Info

Official documentation:

- [docker logs](https://docs.docker.com/reference/cli/docker/container/logs/)
- [docker run: environment variables](https://docs.docker.com/reference/cli/docker/container/run/)
- [Postgres image on Docker Hub](https://hub.docker.com/_/postgres)

## Tips

<details>
<summary>Tip 1</summary>

A container that exited has already told you why. Read its output with `docker logs`.

</details>

<details>
<summary>Tip 2</summary>

The logs name an environment variable that the image requires. Check the exit code too with `docker inspect db | grep -i exitcode`.

</details>

<details>
<summary>Tip 3</summary>

A container's configuration can't be changed after creation. Remove it and run it again with `-e` to set the variable.

</details>

## Solution

<details>
<summary>Solution</summary>

Read the logs:

```
docker logs db
```

Remove the old container:

```
docker rm db
```

Run it again with the password set:

```
docker run -d --name db -e POSTGRES_PASSWORD=secret postgres:15-alpine
```

</details>
