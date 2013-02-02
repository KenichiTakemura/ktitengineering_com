# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
require "db/seeds/seed_helper"

KtitEngineering.destroy_all

client = Client::Client.find_by_namespace("ktit_engineering")

ktit = KtitEngineering.new(:flyer_text => "Web Engineering, IT Consulting, All IT for your business")
ktit.head_text = "Everything from the Web. Web Engineering for Businesses."
ktit.lead_text = "" 
ktit.client = client
ktit.save

_attach("ktitengineering", Image, ktit)

ktit.publish

service = Service.new
service.headline = "ktit.service.first.headline"
service.leadline = "ktit.service.second.headline"
service.save
ktit.service << service