class Template::Engineering < Template::General
  self.abstract_class = true
  has_many :carousel, :as => :templatable, :class_name => 'Carousel', :dependent => :destroy
  has_many :service, :as => :templatable, :class_name => 'Service', :dependent => :destroy
end