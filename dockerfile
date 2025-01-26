# Stage 1: Build the application using Maven with OpenJDK 21
FROM openjdk:21-slim AS build

# Install Maven in the build stage
RUN apt-get update && apt-get install -y maven

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Stage 2: Run the application with OpenJDK 21
FROM openjdk:21-slim

# Expose the port the app will run on
EXPOSE 8080

# Copy the JAR file from the build stage
COPY --from=build /app/target/demo-1.0.0.jar app.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
