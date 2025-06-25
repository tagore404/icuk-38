FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Adjust this path if needed (e.g., build/libs for Gradle)
COPY target/oms-order-service-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9093

ENTRYPOINT ["java", "-jar", "app.jar"]
