## Pre cleanup
#docker rmi mooiweer-frontend:$RELEASETAG
rm -rf dist

## Build the application
ng build --configuration production

## Build the Docker container
#docker build --rm -t mooiweer-frontend:$RELEASETAG .
docker buildx build --platform linux/amd64 -t mooiweer-frontend:$RELEASETAG .
docker tag library/mooiweer-frontend:$RELEASETAG $nugeturl/docker/library/mooiweer-frontend:$RELEASETAG

## Publish
docker push $nugeturl/docker/library/mooiweer-frontend:$RELEASETAG

## Cleanup built images
docker rmi mooiweer-frontend:$RELEASETAG
docker rmi $nugeturl/docker/mooiweer-frontend:$RELEASETAG

## Cleanup working dir
rm -rf dist
docker image prune -a --force