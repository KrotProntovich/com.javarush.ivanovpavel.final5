# Этап сборки
FROM maven:3.8.7-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
# Проверяем содержимое после копирования pom.xml
RUN ls -la
COPY src/ src/
# Проверяем содержимое после копирования src
RUN ls -la src
RUN mvn clean install -P prod
# Проверяем существование target директории
RUN ls -la target
# Получаем список всех JAR-файлов в target
RUN find target/ -name "*.jar"
# Проверяем наличие JAR-файла
RUN test -f /app/target/*.jar || (echo "JAR file not found!" && false)

# Этап запуска
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar .
COPY ./resources ./resources
COPY ./config/nginx.conf ./config/nginx.conf
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "jira-1.0.jar"]
