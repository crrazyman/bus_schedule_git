FROM alpine:latest AS gradle
WORKDIR /opt

RUN apk add unzip wget; \
	wget -O gradle-4.7-bin.zip https://services.gradle.org/distributions/gradle-4.7-bin.zip; \
	unzip -d /opt/gradle gradle-4.7-bin.zip


FROM openjdk:8u151-jdk AS java


FROM node:18-bullseye-slim as node

COPY --from=java /usr/lib/jvm /usr/lib/jvm
COPY --from=gradle /opt/gradle/gradle-4.7 /opt/gradle

ENV PATH="${PATH}:/usr/lib/jvm/java-8-openjdk-arm64/bin/:/opt/gradle/bin"

ADD . /opt/app

WORKDIR /opt/app

EXPOSE 3000
CMD ["npm", "start"]

