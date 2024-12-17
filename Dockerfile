# Use an official Nginx image 
FROM nginx:latest 
# Copy the index.html to the Nginx web root 
COPY index.html /usr/share/nginx/html/index.html 
# Expose port 80 
EXPOSE 80 
# Run Nginx in the foreground 
CMD ["nginx", "-g", "daemon off;"] 
