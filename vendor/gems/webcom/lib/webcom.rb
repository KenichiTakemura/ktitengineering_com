module Webcom
  
  require 'webcom/post_def'
  require 'webcom/browser'
  require 'webcom/date_util'
  require 'webcom/exceptions'
  require 'webcom/subdomain'
  require 'webcom/utils'
  
  require 'webcom/railtie' if defined?(Rails::Railtie)
  
  def self.version
    "0.0.1"
  end
end
