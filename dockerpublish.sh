# Check if Docker is running
if docker info >/dev/null 2>&1; then
    # Docker is running
    echo "Docker is actief, bouwen maar..."

    export nugeturl="proget.apula.it"
    export RELEASETAG=$(date +"20%y%m%d%H%M") 

    echo "# Deployment script for Docker Release $RELEASETAG" > _deployment/deploy.sh

    ## Start with the app, takes the most time
    cd frontend
    bash dockerpublish.sh

    ## Build and deploy the backend
    cd ../backend
    bash dockerpublish.sh
    cd ../


    echo "export RELEASETAG=\"$RELEASETAG\"" >> _deployment/deploy.sh
    echo "docker compose down --remove-orphans" >> _deployment/deploy.sh
    echo "docker compose pull" >> _deployment/deploy.sh
    echo "docker compose up -d" >> _deployment/deploy.sh
    echo "docker image prune -a --force" >> _deployment/deploy.sh
else
  # Docker is not running, so exit the script with an error message
  echo "Error: Docker is not running."
  exit 1
fi

