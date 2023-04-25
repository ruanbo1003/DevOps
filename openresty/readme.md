
## build base image
```shell
docker build -t openresty_base:latest -f docker/Dockerfile-base .
```
## build app image
```shell
docker build -t openresty_app:latest -f docker/Dockerfile .
```
## run for test
```shell
docker run -it --rm -p 80:80 openresty_app:latest
```


