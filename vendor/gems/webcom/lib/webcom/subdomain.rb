module Webcom
  class
    Subdomain
    def self.matches?(request)
      Rails.logger.debug("Subdomain: #{request.subdomain}")
      request.subdomain.present? && request.subdomain != "www"
    end
  end
end