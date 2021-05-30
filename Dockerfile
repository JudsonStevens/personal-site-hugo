FROM alpine:3.12.0 as HUGO

RUN apk update && apk add hugo

COPY . /static-site

RUN hugo -v --source=/static-site --destination=/static-site/public

FROM nginx:stable-alpine

RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html

COPY --from=HUGO /static-site/public/ /usr/share/nginx/html/

EXPOSE 80