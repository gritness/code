# NOTE: this example is taken from the default Dockerfile for the official nginx Docker Hub Repo
# https://hub.docker.com/_/nginx/

# all images must have a FROM
# usually from a minimal Linux distribution like debian or (even better) alpine
# if you truly want to start with an empty container, use FROM scratch
FROM alpine:latest

# optional commands to run at shell inside container at build time
RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y gnupg1 \
	apt-get remove --purge -y gnupg1 && apt-get -y --purge autoremove && rm -rf /var/lib/apt/lists/* \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt=${NGINX_VERSION} \
						nginx-module-geoip=${NGINX_VERSION} \
						nginx-module-image-filter=${NGINX_VERSION} \
						nginx-module-njs=${NJS_VERSION} \
						gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# expose these ports on the docker virtual network
# you still need to use -p or -P to open/forward these ports on host
EXPOSE 80 443

# required: run this command when container is launched
# only one CMD allowed, so if there are multiple, last one wins
CMD ["nginx", "-g", "daemon off;"]
###