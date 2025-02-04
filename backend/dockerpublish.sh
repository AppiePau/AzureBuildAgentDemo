## Pre cleanup
#docker rmi mooiweer-backend:$RELEASETAG
rm -rf app-release

## Build
dotnet publish -c Release -o app-release 
#docker build --rm -t mooiweer-backend:$RELEASETAG .
docker buildx build --platform linux/amd64 -t mooiweer-backend:$RELEASETAG .
docker tag library/mooiweer-backend:$RELEASETAG $nugeturl/docker/library/mooiweer-backend:$RELEASETAG

## Publish
docker push $nugeturl/docker/library/mooiweer-backend:$RELEASETAG

## Cleanup built images
docker rmi mooiweer-backend:$RELEASETAG
docker rmi $nugeturl/docker/mooiweer-backend:$RELEASETAG

## Cleanup work dir
rm -rf app-release
docker image prune -a --force