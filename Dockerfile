FROM ruby:3.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /wellster_telemedicine_app
WORKDIR /wellster_telemedicine_app
ADD Gemfile /wellster_telemedicine_app/Gemfile
ADD Gemfile.lock /wellster_telemedicine_app/Gemfile.lock
RUN bundle install
ADD . /wellster_telemedicine_app