# Use the official Nginx base image
FROM nginx:latest

# Copy custom configuration file from the current directory
# to the Nginx configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy website files from the current directory to the web root directory
COPY html/ /usr/share/nginx/html/

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

