

## build and run
* build base image
```shell
docker build -t openresty_base:latest -f docker/Dockerfile-base .
```
* build app image
```shell
docker build -t openresty_app:latest -f docker/Dockerfile .
```
* run for test
```shell
docker run -it --rm -p 80:80 openresty_app:latest
```

## lua api handler
* request: POST localhost:80/lua/http?id=100&key=tom
```json
{
    "name": "robert",
    "email": "a@g.com"
}
```
* response
```json
{
    "server_addr": "172.17.0.2",
    "server_port": "80",
    "remote_addr": "172.17.0.1",
    "remote_port": "56758",
    "uri": "/lua/http",
    "request_method": "POST",
    "args": "id=100&key=tom",
    "request_body": {
        "email": "a@g.com",
        "name": "robert"
    },
    "content_length": "48",
    "content_type": "application/json",
    "host": "localhost",
    "msec": "1682395969.498",
    "header": {
        "content-type": "application/json",
        "user-agent": "PostmanRuntime/7.30.1",
        "accept": "*/*",
        "cache-control": "no-cache",
        "postman-token": "41708e7c-a0fb-4786-b636-1e07301ff1e0",
        "accept-encoding": "gzip, deflate, br",
        "host": "localhost:80",
        "connection": "keep-alive",
        "content-length": "48"
    },
    "scheme": "http"
}
```

