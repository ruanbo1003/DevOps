#!/bin/bash

nginx -c /etc/nginx/nginx.conf -g "daemon on;"
python3 /app/src/main.py
