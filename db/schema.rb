# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130103042427) do

  create_table "authorized_lists", :force => true do |t|
    t.integer  "client_id"
    t.integer  "flyer_id"
    t.integer  "last_access"
    t.string   "email",       :null => false
    t.string   "provider",    :null => false
    t.string   "uid"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "carousels", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.boolean  "special"
    t.boolean  "enabled"
    t.string   "headline"
    t.string   "leadline"
    t.integer  "status"
    t.integer  "write_at"
    t.boolean  "has_image",        :default => false
    t.integer  "templatable_id"
    t.string   "templatable_type"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "display_name",      :null => false
    t.string   "namespace",         :null => false
    t.string   "template",          :null => false
    t.string   "access_key",        :null => false
    t.string   "modelname",         :null => false
    t.integer  "access_key_update", :null => false
    t.string   "business_copy"
    t.string   "business_abn"
    t.string   "business_address"
    t.string   "business_url"
    t.string   "business_phone"
    t.string   "business_fax"
    t.string   "business_email"
    t.string   "contact_name"
    t.string   "search_keyword"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "contacted_by_id"
    t.string   "contacted_by_type"
    t.string   "contact_type"
    t.text     "body"
    t.string   "user_name"
    t.string   "email"
    t.string   "business_name"
    t.string   "phone"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "contents", :force => true do |t|
    t.text     "body",           :limit => 16777215
    t.integer  "contented_id"
    t.string   "contented_type"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "flyers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "flyer_name"
    t.string   "flyer_image"
    t.string   "flyer_url"
    t.datetime "agreed_on"
    t.string   "agree_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "flyers", ["provider", "uid"], :name => "index_flyers_on_provider_and_uid"
  add_index "flyers", ["reset_password_token"], :name => "index_flyers_on_reset_password_token", :unique => true

  create_table "images", :force => true do |t|
    t.boolean  "is_deleted",                              :default => false
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "avatar_content_type"
    t.string   "medium_size"
    t.string   "thumb_size"
    t.string   "original_size"
    t.integer  "write_at"
    t.integer  "attached_by_id"
    t.string   "attached_by_type"
    t.integer  "attached_id"
    t.string   "attached_type"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.text     "something",           :limit => 16777215
    t.string   "source_url"
    t.string   "link_to_url"
  end

  create_table "ktit_engineerings", :force => true do |t|
    t.string   "flyer_text"
    t.string   "head_text"
    t.string   "lead_text"
    t.integer  "client_id"
    t.boolean  "is_public",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "logos", :force => true do |t|
    t.boolean  "is_deleted",          :default => false
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "avatar_content_type"
    t.string   "medium_size"
    t.string   "thumb_size"
    t.string   "original_size"
    t.integer  "write_at"
    t.integer  "attached_by_id"
    t.string   "attached_by_type"
    t.integer  "attached_id"
    t.string   "attached_type"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.boolean  "special"
    t.boolean  "enabled"
    t.string   "headline"
    t.string   "leadline"
    t.integer  "status"
    t.integer  "write_at"
    t.boolean  "has_image",        :default => false
    t.integer  "templatable_id"
    t.string   "templatable_type"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
