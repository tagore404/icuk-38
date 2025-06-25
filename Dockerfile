# ---------- Stage 1: Build the JAR ----------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy the source code
COPY . .

# Build the JAR file
RUN mvn clean package -DskipTests


# ---------- Stage 2: Create runtime image ----------
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/oms-order-service-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9093

ENTRYPOINT ["java", "-jar", "app.jar"]
