# Dev Game Docker configuration

Project for deploy the whole dev-game project in one docker image


## Build the project

```
./build.sh <image-version>
```

## Start project in docker after build image

```
./start.sh <image-version>
```

## Publish image to DockerHub

```
docker push ggjnez92/dev-game:<image-version>
```
