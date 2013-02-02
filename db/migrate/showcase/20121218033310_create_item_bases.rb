class CreateItemBases < ActiveRecord::Migration
  def create_base_table(table)
    create_table(table, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.string :key
      t.string :name
      t.boolean :special
      t.boolean :enabled
      t.string :headline
      t.string :leadline
      t.integer :status
      t.integer :write_at
      t.boolean :has_image, :default => false
      t.references :templatable, :polymorphic => true
      t.timestamps
    end
  end
end