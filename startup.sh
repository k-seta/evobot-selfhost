#! /bin/sh

mkdir -p /home
cd /home

export DISCORD_BOT_TOKEN=$(curl -H "Metadata-Flavor: Google" 'http://metadata.google.internal/computeMetadata/v1/instance/attributes/discord-bot-token')

docker run -e DISCORD_BOT_TOKEN=${DISCORD_BOT_TOKEN} -e MAXIMUM_AUDIO_DURATION_IN_SECONDS=3600 --name discord-music-bot --rm twinproduction/discord-music-bot
