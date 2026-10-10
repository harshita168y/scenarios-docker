# Step 3: Containers that can't find each other

`client` needs to call `backend` by name, but it fails:

```
docker exec client wget -qO- -T 3 http://backend
```{{exec}}

**Task:** make that command print the nginx welcome page.

Investigate which networks they are on:

```
docker network ls
docker inspect backend client --format '{{.Name}}: {{json .NetworkSettings.Networks}}'
```{{exec}}

Both are on the default `bridge` network, which does **not** provide DNS resolution by container name.

<details>
<summary>Hint</summary>

Create a user-defined network and attach both containers to it:

```
docker network create appnet
docker network connect appnet backend
docker network connect appnet client
```

No need to recreate the containers.

</details>
