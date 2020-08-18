FROM nginx:1.15.8
RUN apt-get update && apt-get install -y curl
ADD ./containers/nginx/nginx.conf /etc/nginx/conf.d/myapp.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
EXPOSE 80