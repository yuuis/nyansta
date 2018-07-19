FROM ruby:2.5.1-stretch
ENV PORT=3000
ENV RAILS_ENV=production
WORKDIR /app
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install --path vendor/bundle 
ADD . .
RUN bundle exec rails db:migrate
CMD bundle exec rails s -p $PORT