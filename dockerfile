FROM ruby:2.7.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn
# Install nodejs lts ↓
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get install -y nodejs build-essential

ARG APP_NAME
WORKDIR /${APP_NAME:-app}

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
COPY . /${APP_NAME:-app}

RUN mkdir -p tmp/sockets

# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT [ "entrypoint.sh" ]
# EXPOSE 3000

# CMD [ "rails", "server", "-b", "0.0.0.0" ]

