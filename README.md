# Salt-master

## Supported tags

* latest: last version build

## Usage

Run salt-master

```sh
$ docker run -d \
    --name saltstack \
    -e API_USER_NAME=apisalt \
    -e API_USER_PASS=salt \
    t7k312/salt-master
```

## docker-compose

```
version: '3.7'

services:
  saltstack:
    image: t7k312/salt-master
    container_name: saltstack
    environment:
      - API_USER_NAME=apisalt
      - API_USER_PASS=salt
    volumes:
      - /path/to/config:/etc/salt/master.d
    restart: unless-stopped
```

## Configuration

Environment Configuration:

* API_USER_NAME - Username for API
* API_USER_PASS - Password for API
