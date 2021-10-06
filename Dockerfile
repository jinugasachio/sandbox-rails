FROM ruby:3.0.2

ENV APP_HOME /sandbox-rails

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
      nodejs \
      postgresql-client

WORKDIR /APP_HOME

COPY Gemfile /APP_HOME/Gemfile
COPY Gemfile.lock /APP_HOME/Gemfile.lock

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]