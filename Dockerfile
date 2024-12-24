# Use a base image with JDK installed
FROM openjdk:17-jdk-slim

# Install necessary libraries (libcrypt)
RUN apt-get update && \
    apt-get install -y libxcrypt-compat && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/chat-1.jar app.jar

# Expose the application port
EXPOSE 8088

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
