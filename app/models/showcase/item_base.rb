class Showcase::ItemBase < ActiveRecord::Base
  self.abstract_class = true
  
  attr_accessible :key, :name, :special, :enabled, :headline, :leadline, :status, :write_at
  
  has_many :image, :as  => :attached, :class_name => 'Image', :dependent => :destroy
  
  scope :active, where("enabled = true")

  def set_has_image(yesno)
    update_attribute(:has_image, yesno)
  end
  
  def has_image?
    has_image
  end

end
