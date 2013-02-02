class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :display_name, :null => false, :unique => true
      t.string :namespace, :null => false, :unique => true
      t.string :template, :null => false, :unique => false
      t.string :access_key, :null => false, :unique => true
      t.string :modelname, :null => false, :unique => true
      t.integer :access_key_update, :null => false
      t.string :business_copy, :null => true
      t.string :business_abn, :null => true
      t.string :business_address, :null => true
      t.string :business_url, :null => true
      t.string :business_phone, :null => true
      t.string :business_fax, :null => true
      t.string :business_email, :null => true
      t.string :contact_name, :null => true
      t.string :search_keyword, :null => true
      t.timestamps
    end
  end
end
