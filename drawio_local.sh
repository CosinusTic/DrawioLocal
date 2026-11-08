#!/usr/bin/env bash

HOST_PORT=8080
DOCKER_PORT=8080
HOST=127.0.0.1

if [ $# -eq 3 ]; then
	HOST_PORT=$1
	DOCKER_PORT=$2
else
	echo "[i] No arguments provided, defaulting to 8080:8080 mapping."
fi


if ! docker ps --format '{{.Names}}' | grep -qx drawio; then
	if docker ps -a --format '{{.Names}}' | grep -qx drawio; then
		echo "[i] Starting drawio docker ..."
		docker start drawio
	else
		echo "[i] No docker instance found locally, pulling and starting ..."
		docker run -d \
			--name drawio \
			-p "$HOST:$HOST_PORT":"$DOCKER_PORT" \
			-e 'DRAWIO_CONFIG={"lockdown":true}' \	# no outbound connection
			jgraph/drawio
	fi

	echo "[+] Docker started successfully!"
fi

URL="http://$HOST:$HOST_PORT/?offline=1&https=0"

echo "[i] Local draw.io avilable at '$URL'" 
xdg-open "$URL"

