rm -rf public/system/data/images/avatars
rake db:drop --trace
rake db:create --trace
rake db:migrate --trace
rake db:test:load
rake db:drop --trace RAILS_ENV="production"
rake db:create --trace RAILS_ENV="production"
