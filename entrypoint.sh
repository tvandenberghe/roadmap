#compile the assets
rake assets:precompile
rake webpacker:compile
# Start the server
rails server -b '0.0.0.0'

