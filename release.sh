#!/bin/bash
PROJECT="ktitengineering_com"
DATE=`date +%Y%m%d%H%M`
#rm -rf vendor/gems
#mkdir -p vendor/gems
#cp -pr ../../gems/webcom vendor/gems
tar jcvfh ./release/${PROJECT}_$DATE.tar.bz2\
 app/controllers\
 app/helpers\
 app/mailers\
 app/models\
 app/views\
 app/data/ktitengineering\
 app/data/logo\
 script\
 config/locales\
 config/routes.rb\
 config/application.rb\
 config/boot.rb\
 config/environment.rb\
 config/initializers\
 config/environments/production.rb\
 db/migrate\
 db/seeds\
 lib\
 Gemfile\
 public/*html\
 vendor/gems\
 public/assets\
 public/favicon.ico\
 public/robots.txt
mv public/assets public/x_assets 2> /dev/null
