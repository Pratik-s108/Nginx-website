# use nginx as base image 
FROM nginx:latest  

# Setting Working directory where the project data will store and project will run
WORKDIR /usr/share/nginx/html

# Downloading css template from internet to /usr/share/nginx/html/ directory 
ADD https://templatemo.com/live/templatemo_595_3d_coverflow /usr/share/nginx/html/

# Now, entering into /usr/share/nginx/html directory and removing the existing
# index.html file then the css file which is donloaded renaming that file to 
# index.html 
RUN cd /usr/share/nginx/html/ && \
	rm index.html && \
	mv templatemo_595_3d_coverflow index.html

# Expose port 80 so external users can access the website via HTTP
EXPOSE 80

# Start Nginx in the foreground (required for containers to stay running)
CMD ["nginx", "-g", "daemon off;"]


# /usr/share/nginx/html is the root directory where the index.html lies for hosting static website
