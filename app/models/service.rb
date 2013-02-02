class Service < Showcase::ItemBase
  
  belongs_to :templatable, :polymorphic => true
  has_one :content, :as => :contented, :dependent => :destroy
  
  accepts_nested_attributes_for :content
  attr_accessible :content, :content_attributes
  alias_method :content=, :content_attributes=

end
