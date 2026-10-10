#!/bin/bash
docker exec client wget -qO- -T 3 http://backend 2>/dev/null | grep -q "Welcome to nginx"
