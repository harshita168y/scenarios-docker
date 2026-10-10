# The image that won't build

## Instructions

A teammate left a broken project in `/root/broken-app`. Go to that directory and try to build it:

```
cd /root/broken-app
ls
cat Dockerfile
docker build -t broken-app .
```{{exec}}

Fix the `Dockerfile` so that the image builds **and** the container prints `app is healthy`:

```
docker run --rm broken-app
```

There is more than one bug. Something may build fine and still fail at runtime.

## Info

Official documentation:

- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)
- [COPY instruction](https://docs.docker.com/reference/dockerfile/#copy)
- [docker build](https://docs.docker.com/reference/cli/docker/image/build/)

## Tips

<details>
<summary>Tip 1</summary>

Read the build error carefully. It names the image it could not find.

</details>

<details>
<summary>Tip 2</summary>

Compare the filename in `COPY` with the real file name from `ls`. The build context only contains what is in the directory.

</details>

<details>
<summary>Tip 3</summary>

If the build works but `docker run` fails, check the script name used in `CMD`.

</details>

## Solution

<details>
<summary>Solution</summary>

Change the first line of the `Dockerfile` to:

```
FROM python:3.12-alpine
```

Change the `COPY` line to:

```
COPY main.py /app/
```

Change the `CMD` line to:

```
CMD ["python", "main.py"]
```

Build the image:

```
docker build -t broken-app .
```

</details>
