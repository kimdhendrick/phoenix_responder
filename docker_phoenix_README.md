# Docker & Phoenix

This is the fastest (but not necessarily the best) way to setup elixir, phoenix, docker

## Create Phoenix Project

This part is a little ugly because you have to install several things you won't really need now, but will regrest not having there in later steps. On the upside, you only have to do this one time.

1. Run a docker container for elixir
  - `docker run -it --rm -v $(pwd):/usr/src/app elixir:1.10.3 bash`

2. Within the docker cli
2.1 `cd /usr/src/app`
2.2 install hex and phoenix
  - `mix do local.hex --force, archive.install hex phx_new 1.5.3`
2.3 install nodejs and inotify-tools
  - `curl -sL https://deb.nodesource.com/setup_10.x | bash -`
  - `apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs`
2.4 `mix phx.new hello`
2.5 Exit the docker cli

## Setup the Project

Outside of docker...

1. `cd hello`
2. create Dockerfile
```
FROM elixir:1.10.3

LABEL maintainer="david.madouros@gmail.com"

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  inotify-tools

WORKDIR /usr/src/app
RUN mix do local.hex --force, local.rebar --force, archive.install hex phx_new

COPY . /usr/src/app/

CMD  ["mix", "phx.server"]
```

3. create docker-compose.yml
```
version: "3.8"

services:
  web:
    build: .
    ports:
      - "4000:4000"
    volumes:
      - .:/usr/src/app
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: hello_dev
      DATABASE_HOST: database

  database:
    image: postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: hello_dev
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

4. update `config/dev.exs`
Change `hostname: "localhost",` to `hostname: "database",`

## Create Database

1. `docker-compose up -d database`
2. `docker-compose run web mix ecto.create`
3. `docker-compose up -d web`

## Visit page

1. http://localhost:4000/