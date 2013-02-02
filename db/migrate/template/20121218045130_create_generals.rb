class CreateGenerals < ActiveRecord::Migration
  def create_base_table(table)
    create_table(table, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.string :flyer_text
      t.string :head_text
      t.string :lead_text
      t.references :client
      t.boolean :is_public, :default => false
      t.timestamps
    end
  end
end
