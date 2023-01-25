FROM ruby:3.0

ENV APP_USER dev
ENV APP_USER_HOME /home/dev
ENV DB_HOST db
ENV DB_USER root
ENV DB_PASSWORD root

# this usually breaks after creating the image because the user is already created; it's ok to comment it
RUN useradd --home $APP_USER_HOME --shell /bin/bash $APP_USER

# unfrozen if gems have changed; frozen otherwise
# RUN bundle config unset frozen
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY --chown=dev . /app

EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0"]

USER $APP_USER
