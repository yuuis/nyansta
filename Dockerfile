FROM ruby:2.5.1-stretch
ENV PORT=3000
WORKDIR /app
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install --path vendor/bundle 
ADD . .
RUN bundle exec rails db:migrate --environment production
CMD bundle exec rails s --environment production -p $PORT