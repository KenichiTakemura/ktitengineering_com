class CreateAuthorizedLists < ActiveRecord::Migration
  def change
    create_table :authorized_lists do |t|
      t.references :client
      t.references :flyer
      t.integer :last_access, :null => true
      t.string :email, :null => false
      t.string :provider, :null => false
      t.string :uid, :null => true
      t.timestamps
    end
  end
end
