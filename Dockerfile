FROM maven:3-jdk-8-alpine as builder
  
COPY . /data/springboot-helloworld
WORKDIR /data/springboot-helloworld
RUN ["mvn", "clean", "install"]

FROM openjdk:8-alpine

WORKDIR /data
COPY --from=builder /data/springboot-helloworld/target/*.jar ./app.jar
CMD ["java", "-jar", "app.jar"]
