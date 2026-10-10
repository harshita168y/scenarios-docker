# Step 2: Running, but unreachable

The container `web` is **up**, but the site doesn't respond:

```
curl -i localhost:8080
```{{exec}}

**Task:** make `http://localhost:8080` return the nginx welcome page.

Investigate:

```
docker ps --filter name=web
docker port web
```{{exec}}

Which port is the process **inside** the container really listening on? Check from inside:

```
docker exec web netstat -tlnp
```{{exec}}

<details>
<summary>Hint</summary>

Port mapping is `-p HOST:CONTAINER`. The container port must match what the app listens on (nginx listens on 80). Recreate `web` with the correct mapping.

</details>
