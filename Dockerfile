FROM ruby:3.0.2

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
      nodejs \
      postgresql-client

WORKDIR /sandbox-rails

COPY Gemfile /sandbox-rails/Gemfile
COPY Gemfile.lock /sandbox-rails/Gemfile.lock

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]