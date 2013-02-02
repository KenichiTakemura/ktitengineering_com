class Category < Showcase::ItemBase
  
  has_many :item
  
  scope :has_item, lambda { joins("left outer join items on items.category_id = categories.id").where("items.category_id is not NULL").group("categories.id") }
  
end
