FROM maven:3-jdk-8-alpine as builder
  
COPY . /dockerproje/dummy-spring-boot
WORKDIR /dockerproje/dummy-spring-boot
RUN ["mvn", "clean", "install", "-Dmaven.test.skip=true"]

FROM openjdk:8-alpine

WORKDIR /data
COPY --from=builder /dockerproje/dummy-spring-boot/target/*.jar ./app.jar
CMD ["java", "-jar", "app.jar"]
