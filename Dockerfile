# FROM alpine@sha256:df5a62c11342b503e692ac719f9569da3518c8f1d5a7f072ad76f1b5ef8d3d43 as HUGO

# RUN apk update && apk add hugo

# COPY . /static-site

# RUN hugo -v --source=/static-site --destination=/static-site/public

# FROM nginx:stable-alpine

# RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html

# COPY --from=HUGO /static-site/public/ /usr/share/nginx/html/

# EXPOSE 80

FROM alpine@sha256:df5a62c11342b503e692ac719f9569da3518c8f1d5a7f072ad76f1b5ef8d3d43 as build

RUN apk update && apk add hugo

COPY . /static-site

RUN hugo -v --source=/static-site --destination=/static-site/public

#Copy static files to Nginx
FROM nginx:alpine
RUN apk --update add curl bash

WORKDIR /usr/share/nginx/html
COPY --from=build /static-site/public /usr/share/nginx/html
EXPOSE 80 443