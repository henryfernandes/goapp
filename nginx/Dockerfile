# Start from a Centos image and install nginx.
FROM ubuntu

# Update the OS and install nginx on the container's workspace.
RUN apt-get update && apt-get install nginx -y

# Copy the conf files to the container's workspace.
ADD default /etc/nginx/sites-available/default

# Run the service restart when the container starts.

# Document that the service listens on port 80.
EXPOSE 80
