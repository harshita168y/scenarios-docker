# Step 5: The image that won't build

A teammate left a broken project in `/root/broken-app`:

```
cd /root/broken-app
ls
cat Dockerfile
docker build -t broken-app .
```{{exec}}

**Task:** fix the `Dockerfile` so that

```
docker build -t broken-app .
docker run --rm broken-app
```

builds successfully and prints `app is healthy`.

There is more than one bug, and the container may build fine but still fail at runtime. Read each error message carefully.

Edit the file with `vim Dockerfile` or `nano Dockerfile`.

<details>
<summary>Hint</summary>

Three problems: a typo in the base image tag, `COPY` references a file that doesn't exist in the build context, and `CMD` runs a script name that doesn't exist. Check the real filename with `ls`.

</details>
