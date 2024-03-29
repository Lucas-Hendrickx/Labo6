From alpine/git
WORKDIR /app
Run git clone https://github.com/Lucas-Hendrickx/Labo6.git

FROM maven:3.6.1-jdk-8-alpine
WORKDIR /app
copy --from=0 /app/Labo6 /app
RUN mvn clean install

FROM tomcat:8.5.43-jdk8
WORKDIR /app
COPY --from=1 /app/target/project-ucll-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/project
EXPOSE 8080
