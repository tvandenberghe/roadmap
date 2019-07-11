#compile the assets
rm -rf public/assets
rm -rf public/packs
rake assets:precompile
rake webpacker:compile
echo "SECRET_KEY_BASE: $SECRET_KEY_BASE"
# Start the server
rails server -b 0.0.0.0

