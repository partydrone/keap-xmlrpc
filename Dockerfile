FROM ruby:3.0
LABEL author="Andrew Porter <partydrone@icloud.com>"

ENV GEM_HOME /usr/local/bundle
ENV PATH ${GEM_HOME}/bin:${GEM_HOME}/gems/bin:$PATH

RUN gem install yard

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

WORKDIR /opt/gem

COPY lib/keap/xmlrpc/version.rb ./lib/keap/xmlrpc/version.rb
COPY Gemfile* *.gemspec ./
RUN bundle install
COPY . .
