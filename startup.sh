#! /bin/sh

mkdir -p /home
cd /home

export DISCORD_BOT_TOKEN=$(curl -H "Metadata-Flavor: Google" 'http://metadata.google.internal/computeMetadata/v1/instance/attributes/discord-bot-token')
export YOUTUBE_API_KEY=$(curl -H "Metadata-Flavor: Google" 'http://metadata.google.internal/computeMetadata/v1/instance/attributes/youtube-api-key')

docker run -e TOKEN=${DISCORD_BOT_TOKEN} -e YOUTUBE_API_KEY=${YOUTUBE_API_KEY} -e PREFIX='!' eritislami/evobot
