FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .

# Build the app
RUN mvn clean package -DskipTests

# ⬇️ NEW LINE: list all files to confirm actual JAR path
RUN find /app -name "*.jar"
