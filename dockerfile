# Stage 1: Build the application using Maven
FROM maven:3.8.4-openjdk-21-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:21-jdk-slim

# Expose the port the app will run on
EXPOSE 8080

# Copy the JAR file from the build stage
COPY --from=build /app/target/demo-1.0.0.jar app.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
