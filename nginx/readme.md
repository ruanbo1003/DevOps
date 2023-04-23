
## build base image
```shell
docker build -t nginx_proxy_base:latest -f docker/Dockerfile-base .
```
## build app image
```shell
docker build -t nginx_proxy_app:latest -f docker/Dockerfile .
```
## run for test
```shell
docker run -it --rm -p 80:80 nginx_proxy_app:latest
```

## common sense
* nginx -g daemon off;" or CMD ["nginx", "-g", "daemon off;"] in Dockerfile
```text
nginx run as daemon by default. But in docker, the container must have foreground process to keep running.
So use the `daemon off;` to set the nginx process foreground.
```


