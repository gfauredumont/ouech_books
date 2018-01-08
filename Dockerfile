FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Force Bundler to work in parallel
RUN bundle config --global jobs 4
RUN echo 'gem: --no-document' > /root/.gemrc

RUN mkdir /ouech_books
WORKDIR /ouech_books
COPY Gemfile /ouech_books/Gemfile
COPY Gemfile.lock /ouech_books/Gemfile.lock
RUN bundle install
COPY . /ouech_books
