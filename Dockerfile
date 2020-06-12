FROM ruby:2.5.5
RUN echo 'alias be="bundle exec"' >> ~/.bashrc

LABEL maintainer="dev@rxrevu.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  postgresql-client \
  jq \
  awscli \
  nodejs

RUN curl -L https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
    && echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" >> /etc/apt/sources.list.d/elastic-7.x.list \
    && apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends filebeat=7.5.1 metricbeat=7.5.1

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
ENV BUNDLE_PATH /gems
RUN gem install bundler:$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1 | tr -d [:space:])
RUN bundle install

# Metric/File Beats
COPY config/docker/pertask-metricbeat.yml /etc/metricbeat/metricbeat.yml
COPY config/docker/filebeat.docker.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/metricbeat/metricbeat.yml /etc/filebeat/filebeat.yml

COPY . /usr/src/app/
RUN touch ./log/responder_service.log

# Prometheus Exporter
COPY config/docker/initialize_rails.sh /opt/responder_service/initialize.sh
RUN chmod +x /opt/responder_service/initialize.sh

RUN useradd -d /home/app -m -U -s /bin/bash app && chown -R app:app /usr/src/app/ /opt/responder_service/

CMD ["/opt/responder_service/initialize.sh"]
