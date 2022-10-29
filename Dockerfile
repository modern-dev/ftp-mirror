FROM alpine:latest

RUN apk add --no-cache lftp

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh
COPY LICENSE README.md /app/

RUN ["/bin/chmod", "+x", "/app/entrypoint.sh"]

ENTRYPOINT ["/app/entrypoint.sh"]
