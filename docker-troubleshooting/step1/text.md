# Step 1: The container that keeps exiting

A Postgres container named `db` was started, but the application team says the database isn't there.

**Task:** find out why `db` is not running, then get a **running** container named `db`.

Start by looking at all containers, including stopped ones:

```
docker ps -a
```{{exec}}

Then read what the container said before it died:

```
docker logs db
```{{exec}}

Also check the exit code:

```
docker inspect db --format '{{.State.ExitCode}}'
```{{exec}}

<details>
<summary>Hint</summary>

The logs tell you which environment variable is required. Containers can't be edited once created, so remove `db` and run it again with the variable set, for example `-e POSTGRES_PASSWORD=secret`.

</details>
