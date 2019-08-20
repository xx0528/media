#!/bin/sh
Container="movie"
Version="1.0.0"

case "$1" in
    build)
        #docker build -t movie/go-env:$Version .
        docker-compose up
    ;;
    run)
        #docker run --name=$Container -p 12345:12345 -d  movie/go-env:$Version
        docker-compose up
    ;;
    *)
        echo "Usage: param wrong"
        exit 3
    ;;
esac
