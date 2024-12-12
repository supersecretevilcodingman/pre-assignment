# Specify a base image. Alpine doesn't have node by default, so we can 
# Use a version of node that includes alpine.
FROM node:14-alpine

# Create a working directory so that our project files are not in our root directory
WORKDIR /usr/app

# Copy the contents of the current directory (first ./) to the container (second ./).
COPY ./package.json ./
# Install dependencies
RUN npm install
COPY ./ ./
# Command to be run
CMD ["npm", "start"]