# Install DMP Roadmap
Thomas Vandenberghe - 2019-04-11

Based on https://github.com/DMPRoadmap/roadmap/wiki/Installation

## Dependencies
* Ruby >= 2.4.4
* Rails >= 4.2.10 (5.0.0+ to be tested soon)
* PostgreSQL >= 9.2

## Install Ruby

Remove previous versions of Ruby:

	sudo apt-get remove ruby
	sudo apt-get remove ruby2.3

Do not run as root

	gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	sudo \curl -sSL https://get.rvm.io | sudo bash -s stable
	run the command that appears in the confirmation message: source /etc/profile.d/rvm.sh
	add user to the rvm group: sudo /usr/sbin/usermod -a -G rvm tvandenberghe

If Ruby was previously installed:

	rvm fix-permissions
	rvm reinstall ruby-2.4

else: 

	rvm install ruby-2.4
	ruby -v

## Install Rails

	sqlite3 --version
	if needed: sudo apt-get install sqlite3
	gem install rails
	rails -v

Edit ~/.bashrc and add `[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"`

## Install DMP Roadmap

	mkdir ./ruby
	cd ruby
	git clone https://github.com/tvandenberghe/roadmap.git
	cd roadmap

Edit ./Gemfile and comment out the whole `group :mysql do` section, we're using PG anyway.

Don't run as root

	bin/setup
	rake secret
	sudo -H pluma /etc/environment

* add `SECRET_KEY_BASE=generated key`
* add `DEVISE_SECRET_KEY=generated key`
* add `RAILS_ENV=production`

`nano config/secrets.yml`


	development:
		secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
	test:
		secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
	#Do not keep production secrets in the repository,
	#instead read values from the environments.
	production:
		secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  

	gem install bundler  # (if bundler is not yet installed)
	bundle install
	rake db:schema:load
	rake db:seed  # (Unless you are migrating data from an old DMPonline system)

## Install node and npm

	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs


## Install yarn

	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update && sudo apt-get install yarn

	yarn upgrade
	
	Make sure that all gems are executable: 
	sudo chown -R tvandenberghe:dmp .
## Install webpacker

	rake webpacker:install
	rake webpacker:yarn_install

## Compile assets with webpacker

	rake webpacker:compile
	sudo chgrp -R rvm /usr/local/rvm/gems & sudo chmod -R g+rwx /usr/local/rvm/gems & sudo chmod -R g+rwx /usr/local/ruby/roadmap & sudo /usr/sbin/usermod -a -G rvm dmp & rvm fix-permissions

##Inspect Rails logs
sudo nano /var/log/syslog
