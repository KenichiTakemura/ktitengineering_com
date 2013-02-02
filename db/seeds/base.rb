# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require "db/seeds/seed_helper"

Client.destroy_all
AuthorizedList.destroy_all
Flyer.destroy_all

flyer = Flyer.new(:flyer_name => "Kenichi Takemura", :email => "ktakemur@ozflyer.com.au", :password => "kenichi123", :password_confirmation => "kenichi123", :provider => Flyer::Flyer::PROVIDERS[:ozflyer])
flyer.save
## KTIT Engineering
ktitengineering = Client.new
ktitengineering.display_name = "K.T. IT Engineering"
ktitengineering.namespace = "ktit_engineering"
ktitengineering.template = "engineerings"
ktitengineering.access_key = Utils.unique_token
ktitengineering.modelname = "KtitEngineering"
ktitengineering.access_key_update = DateUtil.current_time.to_i
ktitengineering.business_copy = "For all small and personal Business"
ktitengineering.business_abn = "78631933118"
ktitengineering.save

_attach("logo", Logo, ktitengineering)

# Authorized List
authList = AuthorizedList.new(:email => "kenichi_takemura1976@yahoo.com", :provider => Flyer::PROVIDERS[:facebook])
authList.save
ktitengineering.authorized_list << authList
authList = AuthorizedList.new(:email => "ktakemur@ozflyer.com.au", :provider => Flyer::Flyer::PROVIDERS[:ozflyer], :uid => flyer.id)
authList.save
ktitengineering.authorized_list << authList
