#!/bin/sh

DOWNLOAD_URL=`curl -s https://api.github.com/repos/peh/bamboohr-slack-bot/releases/latest | jq '.assets[] | select(.name = "current.war") |  .browser_download_url' --raw-output`
echo "Downloading from $DOWNLOAD_URL"
curl -L# --output /app/current.jar $DOWNLOAD_URL

java -jar /app/current.jar -Ddb.file=$DB_FILE
