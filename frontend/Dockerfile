FROM nginx:latest
RUN apt-get update
RUN apt-get install -y openssl

COPY docker/default.conf /etc/nginx/conf.d/

RUN rm -rf /usr/share/nginx/html/*
COPY dist /usr/share/nginx/html/

# Make serving all files (SVG) possible:
RUN chmod -R o+x /usr/share/nginx/html/
RUN chown -R nginx:root /usr/share/nginx/html/

ADD docker/startup.sh /startup.sh
USER root 
RUN chmod 755 /startup.sh
# EXPOSE 443
EXPOSE 80
ENTRYPOINT /startup.sh 