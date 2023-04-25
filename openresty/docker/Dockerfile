FROM openresty_base:latest

# make the 'app' folder the current working directory
WORKDIR /app/src

# add nginx config file
RUN rm -rf /etc/nginx/nginx.conf
ADD config/proxy.conf /etc/nginx/proxy.conf
ADD config/nginx.conf /etc/nginx/nginx.conf

# nginx log folder
RUN mkdir -p /etc/nginx/logs/

# nginx lua scripts
RUN mkdir -p /etc/nginx/scripts
RUN rm -rf /etc/nginx/scripts/*
ADD scripts /etc/nginx/scripts

# drop the default symlinks
#RUN unlink /var/log/nginx/access.log
#RUN unlink /var/log/nginx/error.log

# add python source files
RUN rm -rf /app/src/*
ADD src /app/src

# add run.sh
ADD docker/entry.sh /app/src/entry.sh

ENV TZ Asia/Shanghai
ENV PYTHONPATH "${PYTHONPATH}:/app/src"

CMD ["/app/src/entry.sh"]
