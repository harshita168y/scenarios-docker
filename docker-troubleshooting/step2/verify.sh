#!/bin/bash
[ "$(curl -s -o /dev/null -w '%{http_code}' --max-time 3 localhost:8080)" = "200" ]
