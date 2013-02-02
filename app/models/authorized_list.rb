class AuthorizedList < ActiveRecord::Base
  attr_accessible :email, :provider, :uid
  belongs_to :flyer
  belongs_to :client
  
  scope :allowed, lambda { |flyer|
    where("email = :email AND provider = :provider", {:email => flyer.email.downcase, :provider => flyer.provider})
  }
  
  def self.allowed?(flyer)
    allowed(flyer)
  end
  
  def to_s
    "Allowed #{email} #{provider} #{uid}"
  end
  
end
