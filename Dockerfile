FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD target/oms-order-service-0.0.1-SNAPSHOT.jar oms-order.jar
RUN sh -c 'touch /oms-order.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/oms-order.jar"]
EXPOSE 9093
