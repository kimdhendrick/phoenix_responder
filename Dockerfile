FROM elixir:1.10.3

LABEL maintainer="developer@rxrevu.com"

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  inotify-tools

WORKDIR /usr/src/app
RUN mix do local.hex --force, local.rebar --force, archive.install hex phx_new

COPY . /usr/src/app/

CMD  ["mix", "phx.server"]
