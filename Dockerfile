FROM ruby:2.5.1-stretch

EXPOSE 3000
VOLUME $APP_ROOT/db

ENV APP_ROOT  /app
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install
COPY . $APP_ROOT

RUN bundle exec bin/rails db:migrate db:seed

RUN bundle exec rails assets:precompile
CMD ["bash", "scripts/start.sh"]
