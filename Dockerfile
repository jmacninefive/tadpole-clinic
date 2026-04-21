FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM eclipse-temurin:17-jre-alpine-3.23 AS final
COPY --from=build /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar clinic.jar
EXPOSE 8080
CMD ["java", "-jar", "clinic.jar"]