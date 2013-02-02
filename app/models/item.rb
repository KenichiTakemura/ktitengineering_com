class Item < Showcase::ItemBase
  
  attr_accessible :barcode, :price_ex_gst, :category_id, :was_price_inc_gst, :extra, :was_price_ex_gst, :price_inc_gst
  validates_presence_of :barcode
  validates_uniqueness_of :barcode
  
  belongs_to :category
  belongs_to :templatable, :polymorphic => true

  scope :category_for, lambda { |category| where("category_id = ?", category).active }
  scope :main_item, where("main = true").limit(1)  
  scope :category_for_all, lambda { |category| where("category_id = ?", category) }

end
