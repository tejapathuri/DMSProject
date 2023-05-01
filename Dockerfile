FROM maven:3.8-openjdk-18 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests


FROM openjdk:18-jdk-slim
COPY --from=build /target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
CMD ["java", "-jar", "DogsManagementSystem.jar"]
