FROM ruby:2.7.0
ENV LANG C.UTF-8

ENV APP_ROOT /myapp
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN apt-get update && \
    apt-get install -y nodejs chromium-driver 

Run curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn && \
    apt-get install --no-install-recommends yarn && \
    gem install bundler && \
    bundle install

COPY . $APP_ROOT

RUN mkdir -p tmp/sockets
