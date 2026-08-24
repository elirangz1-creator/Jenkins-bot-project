#Getz
FROM nginx:alpine
RUN echo "<h1>Hello from my automated DevOps Pipeline!</h1>" > /usr/share/nginx/html/index.html
