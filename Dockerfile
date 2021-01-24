FROM nginx:latest
RUN sed -i 's/nginx/amine/g' /usr/share/nginx/html/index.html
EXPOSE 80
