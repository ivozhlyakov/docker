FROM maven:3.6.3-openjdk-11 as build

ENV PROJECT_DIR=/opt/dir

RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR

ADD  ./pom.xml $PROJECT_DIR
RUN  mvn dependency:resolve

ADD ./src $PROJECT_DIR/src
RUN mvn clean install

FROM openjdk:11-jdk as prod

ENV PROJECT_DIR=/opt/dir
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY --from=build $PROJECT_DIR/target/docker-1.0.0.jar $PROJECT_DIR/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]