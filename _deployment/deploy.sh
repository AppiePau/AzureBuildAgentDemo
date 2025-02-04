# Deployment script for Docker Release 202412091223
export RELEASETAG="202412091223"
docker compose down --remove-orphans
docker compose pull
docker compose up -d
docker image prune -a --force
