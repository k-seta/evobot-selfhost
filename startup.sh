#! /bin/sh

mkdir -p /home
cd /home

git clone https://github.com/freyacodes/archived-bot.git
cd archived-bot/config/templates

export DISCORD_BOT_TOKEN=$(curl -H "Metadata-Flavor: Google" 'http://metadata.google.internal/computeMetadata/v1/instance/attributes/discord-bot-token')

mv selfhosting.yml docker-compose.yml

sed -i -e "s/discordToken: \"\"/discordToken: ${DISCORD_BOT_TOKEN}/g" common.yml

docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose:1.24.0 up
