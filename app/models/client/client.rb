class Client < ActiveRecord::Base
  has_many :authorized_list, :dependent => :destroy
  has_many :logo, :as  => :attached, :class_name => 'Logo', :dependent => :destroy
  def logo?
    logo.present? ? logo.last.original_image : "http://placehold.it/120x100&text=Logo"
  end
end
