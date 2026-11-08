# Local Draw.io docker server

Run draw.io locally through official draw.io Docker image.

## Setup

```sh
./drawio_local.sh [HOST_PORT] [CONTAINER_PORT]
```
> Default ports are 8080 for both hosts and guest, otherwise supply `$1` & `$2` for port forwarding.

## Run
navigate to `http://localhost:<HOST_PORT>/?offline=1&https=0`
