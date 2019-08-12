FROM java:11-alpine

RUN apk add --no-cache curl jq tzdata

WORKDIR /app

COPY entrypoint.sh /app/run.sh

EXPOSE 9000

HEALTHCHECK --start-period=1m30s --interval=30s --timeout=3s CMD curl -f http://localhost:9000/ || exit 1

VOLUME "/app/data/"

CMD ["/app/run.sh"]
