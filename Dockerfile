FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /main
WORKDIR /main
COPY Gemfile /main/Gemfile
COPY Gemfile.lock /main/Gemfile.lock
RUN bundle install
COPY . /main
