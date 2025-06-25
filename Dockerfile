# ---------- Stage 1: Build the JAR ----------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy all project files to container
COPY . .

# Build the project and skip tests
RUN mvn clean package -DskipTests


# ---------- Stage 2: Run the app ----------
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the JAR from the previous stage
COPY --from=builder /app/target/oms-order-service-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9093

ENTRYPOINT ["java", "-jar", "app.jar"]
