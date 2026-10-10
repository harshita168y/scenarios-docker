# Running, but unreachable

## Instructions

The container `web` is **up**, but the site doesn't respond:

```
curl -i localhost:8080
```{{exec}}

Make `http://localhost:8080` return the nginx welcome page.

## Info

Official documentation:

- [Publishing and exposing ports](https://docs.docker.com/engine/network/port-publishing/)
- [docker port](https://docs.docker.com/reference/cli/docker/container/port/)
- [docker exec](https://docs.docker.com/reference/cli/docker/container/exec/)

## Tips

<details>
<summary>Tip 1</summary>

Check how the port is mapped with `docker port web`.

</details>

<details>
<summary>Tip 2</summary>

The `-p` option is `HOST:CONTAINER`. Find the port nginx really listens on inside the container with `docker exec web netstat -tlnp`.

</details>

<details>
<summary>Tip 3</summary>

Port mappings can't be edited on a running container. Remove `web` and run it again with the right mapping.

</details>

## Solution

<details>
<summary>Solution</summary>

Remove the old container:

```
docker rm -f web
```

Run it again with the correct container port:

```
docker run -d --name web -p 8080:80 nginx:alpine
```

</details>
