#!/bin/bash
DATE=`date +%Y%m%d%H%M`
tar jcvf ./release/ktitengineering_com_$DATE.tar.bz2\
 app\
 config.ru\
 doc\
 lib\
 public\
 config\
 db\
 Rakefile\
 script\
 vendor\
 Gemfile\
 public
rm -rf public/assets
