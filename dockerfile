# Use a lightweight web server base image
FROM nginx:alpine

# Copy the static web page to the nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
