FROM ruby:3.0.2 as builder

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    nodejs \
    postgresql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* 

WORKDIR /sandbox-rails

COPY Gemfile /sandbox-rails/Gemfile
COPY Gemfile.lock /sandbox-rails/Gemfile.lock

RUN bundle install

FROM ruby:3.0.2 

WORKDIR /sandbox-rails

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . /sandbox-rails

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]