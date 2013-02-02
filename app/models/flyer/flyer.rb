class Flyer < ActiveRecord::Base
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :rememberable, :registerable, :trackable, :omniauthable
  # Setup accessible (or protected) attributes for your model
  
  # Association

  has_many :image, :as  => :attached_by, :class_name => 'Image', :dependent => :destroy
  validates_presence_of :flyer_name
  
  PROVIDERS = Hash.new
  PROVIDERS[:facebook] = "facebook"
  PROVIDERS[:google] = "google_oauth2"
  PROVIDERS[:ozjapanese] = "ozjapanese"
  PROVIDERS[:ozflyer] = "ozflyer"
  PROVIDERS[:twitter] = "twitter"

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid, :flyer_name
  attr_accessible :flyer_image
  attr_accessible :flyer_url
  
  has_many :authorized_list, :dependent => :nullify
  has_many :image, :as  => :attached_by, :class_name => 'Image', :dependent => :destroy

  # attr_accessible :title, :body
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    logger.info("find_for_facebook_oauth #{auth.provider} #{auth.uid}")
    user = Flyer.where(:provider => auth.provider, :uid => auth.uid).first
    if !user.present?
      logger.info("User is to be created. email: #{auth.info.email}")
      user = Flyer.create(:flyer_name => auth.extra.raw_info.name,
      :provider => PROVIDERS[:facebook],
      :uid => auth.uid,
      :email => auth.info.email,
      :password => Devise.friendly_token[0,20],
      :flyer_image => auth.info.image,
      :flyer_url => auth.extra.raw_info.link
    )
    end
    user
  end

  #access_token #<OmniAuth::AuthHash credentials=#<Hashie::Mash expires=true expires_at=1350894980 token="ya29.AHES6ZRIPUOUgRfWlo_4F3ZXQQ-MFopc9mYekj6jaJr6rmVTPxGH5g"> extra=#<Hashie::Mash raw_info=#<Hashie::Mash email="kenkenpa.kenichi@gmail.com" family_name="Takemura" gender="male" given_name="Kenichi" id="105992782623248923279" link="https://plus.google.com/105992782623248923279" locale="en-GB" name="Kenichi Takemura" verified_email=true>> info=#<OmniAuth::AuthHash::InfoHash email="kenkenpa.kenichi@gmail.com" first_name="Kenichi" last_name="Takemura" name="Kenichi Takemura"> provider="google_oauth2" uid="105992782623248923279">

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    logger.info("find_for_google_oauth2 access_token: #{access_token}")
    data = access_token.info
    provider = access_token.provider
    uid = access_token.uid
    link = access_token.extra.raw_info.link
    email = data["email"]
    logger.info("find_for_google_oauth2 #{provider} #{uid} #{link} #{email}")
    # I should say adding provider check because one can signin Facebook with gmail account
    user = Flyer.where(:provider => provider, :uid => uid).first
    if !user.present?
      logger.info("User is to be created. email: #{data["email"]}")
      user = Flyer.create(:flyer_name => data["name"],
      :provider => provider,
      :uid => uid,
      :email => email,
      :password => Devise.friendly_token[0,20],
      :flyer_url => link
    )
    end
    user
  end
  
  def facebook_flyer?
    self.provider.eql?(PROVIDERS[:facebook])
  end
  
  def google_flyer?
    self.provider.eql?(PROVIDERS[:google])
  end

  def ozflyer_flyer?
    self.provider.eql?(PROVIDERS[:ozflyer])
  end

  def agreed?(term_date)
    self.agreed_on > term_date
  end
  
  def agree
    self.update_attribute(:agreed_on, Common.current_time)
  end
  
  def joinedOn
    Common.date_format_ymdhm(agreed_on)
  end

  def to_s
    "#{email} #{provider} #{uid}"
  end

end
