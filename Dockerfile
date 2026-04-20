FROM maven:latest
WORKDIR /app
COPY . .
RUN mvn package
EXPOSE 8080
CMD ["java", "-jar", "target/spring-petclinic-4.0.0-SNAPSHOT.jar"]