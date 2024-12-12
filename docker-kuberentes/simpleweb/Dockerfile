# Specify a base image. Alpine doesn't have node by default, so we can 
# Use a version of node that includes alpine.
FROM node:14-alpine

# Copy the contents of the current directory (first ./) to the container (second ./).
COPY ./ ./
# Install dependencies
RUN npm install

# Command to be run
CMD ["npm", "start"]