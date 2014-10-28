#!/bin/bash
docker save <image id> > file.tar
docker load -i file.tar
docker export <CONTAINER ID> > file.tar
cat file.tar | docker import - some-image-name:latest
