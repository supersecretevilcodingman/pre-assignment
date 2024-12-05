# Build the application
FROM maven:3.8.5-openjdk-17-slim

# Add a label to specify metadata, such as the purpose of this image.
LABEL description="LibraryProject2 app docker container"

# Set the working directory to that of the project
WORKDIR /LibraryProject2

# Copy the project .jar file to the container
COPY ./LibraryProject2/target/LibraryProject2-0.0.1-SNAPSHOT.jar library-app.jar

# Expose the port that the app runs on
EXPOSE 5000

# Run the application
CMD ["java", "-jar", "library-app.jar"]