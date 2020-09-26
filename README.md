# EI Docker

Scripts to run Evil Islands in docker container.
It uses [x11docker](https://github.com/mviereck/x11docker) as a helper script.

### Setup docker

Use instructions from the official web site: https://docs.docker.com/get-docker/

### Create container

`docker build --rm -t ei .`

### Prepare game's files

1. Put files of the game in EI/ directory
2. Put gipat.ru starter's files in EI/Starter directory

### Run the game

`./run`
