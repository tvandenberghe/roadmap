FROM ruby:2.6.3
RUN apt-get update -qq
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs 
RUN bash -c 'nodejs -v'
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get install -y postgresql-client
COPY . /application
WORKDIR /application
ARG db_password
ENV DB_ADAPTER=postgresql
ENV DB_HOST=db_host
ENV PGPASSWORD=$db_password
ENV RAILS_ENV=production

RUN psql -h "$DB_HOST" -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'roadmap_$RAILS_ENV'" | grep -q 1 || (psql -h "$DB_HOST" -U postgres -tc "CREATE DATABASE roadmap_$RAILS_ENV" && psql -h "$DB_HOST" -d "roadmap_$RAILS_ENV" -U postgres -f db/seeds_full.sql)

RUN bin/setup

#RUN export SECRET_KEY_BASE=$(rake secret);echo $SECRET_KEY_BASE; sed "s:<%= ENV\['SECRET_KEY_BASE'\] %>:$SECRET_KEY_BASE:g" config/secrets.yml;
#RUN export DEVISE_SECRET_KEY=$(rake secret);echo $DEVISE_SECRET_KEY;

RUN bash -l -c 'echo export SECRET_KEY_BASE="$(rake secret)" >> /etc/bash.bashrc'
RUN bash -l -c 'echo export DEVISE_SECRET_KEY="$(rake secret)" >> /etc/bash.bashrc'
ENV DEVISE_SECRET_KEY=$DEVISE_SECRET_KEY
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -y yarn
#RUN rake webpacker:install
RUN rake webpacker:yarn_install
EXPOSE 3000
ENTRYPOINT ./entrypoint.sh

