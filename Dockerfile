FROM openjdk:8
MAINTAINER Saurabh Singh Rajpoot ssrajpoot2803@gmail.com
COPY ./target/ScientificCalculator-1.0-SNAPSHOT.jar ./
WORKDIR ./
CMD ["java", "-jar", "ScientificCalculator-1.0-SNAPSHOT.jar"]
