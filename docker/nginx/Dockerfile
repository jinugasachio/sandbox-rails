FROM nginx:1.21.6-alpine

RUN apk update && apk add --no-cache util-linux

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
