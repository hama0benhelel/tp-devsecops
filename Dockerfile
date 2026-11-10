FROM eclipse-temurin:17-jre-jammy

RUN apt-get update \
    && apt-get -o Acquire::Retries=0 install -y --only-upgrade apt libapt-pkg6.0 \
    && dpkg-query -W apt libapt-pkg6.0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY target/democyber-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]