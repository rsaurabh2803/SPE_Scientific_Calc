FROM openjdk:8
MAINTAINER Saurabh Singh Rajpoot ssrajpoot2803@gmail.com
COPY ./target/SPE_Scientific_Calc-1.0-SNAPSHOT.jar ./
WORKDIR ./
CMD ["java", "-jar", "SPE_Scientific_Calc-1.0-SNAPSHOT.jar"]
