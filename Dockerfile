FROM ruby:2.7.0
ENV LANG C.UTF-8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev --no-install-recommends && \ 
    apt-get install -y vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

Run apt-get update && apt-get install -y curl apt-transport-https wget --no-install-recommends && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -SL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs --no-install-recommends chromium-driver
RUN apt-get update && apt-get install -y default-mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp

ENV APP_ROOT /myapp
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install

COPY . $APP_ROOT

RUN mkdir -p tmp/sockets

VOLUME /myapp/public
VOLUME /myapp/tmp
EXPOSE  3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]