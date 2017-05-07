FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /flow-over-stack
WORKDIR /flow-over-stack
ADD . /flow-over-stack
RUN bundle install