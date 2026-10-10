# Containers that can't find each other

## Instructions

The container `client` needs to call the container `backend` by name, but it fails:

```
docker exec client wget -qO- -T 3 http://backend
```{{exec}}

Make that command print the nginx welcome page, **without recreating the containers**.

## Info

Official documentation:

- [Bridge network driver](https://docs.docker.com/engine/network/drivers/bridge/)
- [docker network create](https://docs.docker.com/reference/cli/docker/network/create/)
- [docker network connect](https://docs.docker.com/reference/cli/docker/network/connect/)

## Tips

<details>
<summary>Tip 1</summary>

List networks with `docker network ls`, then see who is attached to the default one with `docker network inspect bridge`.

</details>

<details>
<summary>Tip 2</summary>

The default `bridge` network does not provide DNS resolution by container name. A user-defined network does.

</details>

<details>
<summary>Tip 3</summary>

You can attach an already running container to another network with `docker network connect`.

</details>

## Solution

<details>
<summary>Solution</summary>

Create a user-defined network:

```
docker network create appnet
```

Attach both containers to it:

```
docker network connect appnet backend
```

```
docker network connect appnet client
```

</details>
