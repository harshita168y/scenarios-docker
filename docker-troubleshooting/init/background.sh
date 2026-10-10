#!/bin/bash
# Step 1: db exits because POSTGRES_PASSWORD is missing
docker pull postgres:15-alpine
docker run -d --name db postgres:15-alpine || true

# Step 2: web publishes the wrong container port
docker pull nginx:alpine
docker run -d --name web -p 8080:8080 nginx:alpine

# Step 3: two containers on the default bridge (no name resolution)
docker run -d --name backend nginx:alpine
docker pull busybox
docker run -d --name client busybox sleep 3600

# Step 4: container with a memory limit that is far too low
docker run -d --name memhog --memory 32m --memory-swap 32m busybox \
  sh -c 'head -c 100000000 /dev/zero | tail -c 1'

# Step 5: broken Dockerfile
mkdir -p /root/broken-app
cat > /root/broken-app/main.py << 'PY'
print("app is healthy")
PY
cat > /root/broken-app/Dockerfile << 'DF'
FROM python:3.12-alpin
WORKDIR /app
COPY app.py /app/
CMD ["python", "app.py"]
DF
docker pull python:3.12-alpine

touch /tmp/finished
