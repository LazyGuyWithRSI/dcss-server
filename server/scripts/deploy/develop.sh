#!/bin/sh

curl -o docker-compose.yml https://raw.githubusercontent.com/refracta/dcss-server/develop/server/docker-compose.yml && \
curl -o docker-compose.override.yml https://raw.githubusercontent.com/refracta/dcss-server/develop/server/docker-compose.ports.yml && \
docker compose down && docker rmi refracta/dcss-server || true && \
docker compose run --rm -T -e CMD='cd $DGL_CONF_HOME && git pull' dcss-server && \
docker compose run --rm -T -e CMD='$SCRIPTS/utils/release.sh download -o -p /data -n game-data' dcss-server && \
docker compose up -d && docker compose logs -f
