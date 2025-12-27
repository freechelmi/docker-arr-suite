#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {up|down|upgrade|init}"
    exit 1
fi
source env/local.env

case "$1" in
    up)
        sudo docker compose up -d 
        ;;
    down)
        sudo docker compose down -v
        ;;
    upgrade)
        sudo docker compose pull
        sudo docker compose down -v
        sudo docker compose up -d
        ;;
    init)
        sudo docker compose pull
        ;;
    *)
        echo "Invalid parameter: $1"
        echo "Usage: $0 {up|down|upgrade|init}"
        exit 1
        ;;
esac
