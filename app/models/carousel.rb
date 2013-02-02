class Carousel < Showcase::ItemBase
  
  belongs_to :templatable, :polymorphic => true
  
end
