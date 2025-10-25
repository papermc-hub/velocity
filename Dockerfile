ARG RUNTIME_IMAGE=docker.io/eclipse-temurin:25-jre-alpine-3.22

FROM alpine:3.22 AS base
WORKDIR /app

ARG VELOCITY_DOWNLOAD_URL
RUN set -eux; \
    apk add --no-cache curl; \
    curl -LfS "${VELOCITY_DOWNLOAD_URL}" -o "velocity.jar";

FROM ${RUNTIME_IMAGE} AS runtime
WORKDIR /app

RUN addgroup -S velocity && adduser -S velocity -G velocity

COPY --from=base --chown=velocity:velocity /app/velocity.jar /app/velocity.jar

RUN chown -R velocity:velocity /app
USER velocity

ENV JAVA_TOOL_OPTIONS="-Xms512m -Xmx1024m -Dfile.encoding=UTF-8" \
    INTERNAL_PORT=25565

EXPOSE ${INTERNAL_PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD nc -z 127.0.0.1 ${INTERNAL_PORT} || exit 1

ENTRYPOINT [ "java", "-jar", "/app/velocity.jar" ]