FROM ruby:2.6.3
RUN apt-get update -qq && curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs 
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get install -y postgresql-client

RUN mkdir -p /application
COPY package.json /application
WORKDIR /application
RUN npm install

#COPY Gemfile /application
#COPY bin/setup /application/bin/
#RUN bin/setup

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -y yarn

ARG db_password
ARG secret
ENV DB_ADAPTER=postgresql
ENV DB_HOST=db_host
ENV PGPASSWORD=$db_password
ENV RAILS_ENV=production
ENV DEVISE_SECRET_KEY=$secret
ENV SECRET_KEY_BASE=$secret

#RUN psql -h "$DB_HOST" -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'roadmap_$RAILS_ENV'" | grep -q 1 || (psql -h "$DB_HOST" -U postgres -tc "CREATE DATABASE roadmap_$RAILS_ENV" && psql -h "$DB_HOST" -d "roadmap_$RAILS_ENV" -U postgres -f db/seeds_full.sql)

COPY . /application
#COPY app/assets/stylesheets/vendor/jquery-ui/datepicker/jquery-ui.min.css /application/app/assets/vendor/jquery-ui/datepicker/
#COPY app/assets/stylesheets/vendor/jquery-ui/datepicker/jquery-ui.structure.min.css /application/app/assets/vendor/jquery-ui/datepicker/
#COPY app/assets/stylesheets/vendor/jquery-ui/datepicker/jquery-ui.theme.min.css /application/app/assets/vendor/jquery-ui/datepicker/

RUN bin/setup
#RUN npm run bundle -- -p --no-watch

RUN cp -r node_modules/tinymce public/
RUN rm -rf public/assets
RUN rm -rf public/packs

RUN rake webpacker:yarn_install
EXPOSE 3000
ENTRYPOINT ./entrypoint.sh

