class Template::General < ActiveRecord::Base

  self.abstract_class = true
  attr_accessible :flyer_text
  attr_accessible :head_text
  attr_accessible :lead_text
  attr_accessible :client_id
  belongs_to :client

  has_many :image, :as  => :attached, :class_name => 'Image', :dependent => :destroy
  
  scope :allspace_for_client, lambda { |client|
    if client.present?
      where('client_id = ?', client)
    end
  }
  
  scope :public, where("is_public = ?", true)
  
  def publish
    self.is_public = true
    update_attribute(:is_public, true)
    client = Client.find(client_id)
    spaces = client.modelname.constantize.allspace_for_client(client_id)
    Rails.logger.debug("spaces: #{spaces.length}")
    spaces.each do |space|
      next if space.id == self.id
      space.update_attribute(:is_public, false)
    end
    self
  end
end