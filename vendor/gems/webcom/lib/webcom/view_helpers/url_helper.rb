module Webcom
  module ViewHelpers
    module UrlHelper
      def with_subdomain(subdomain)
        subdomain = (subdomain || "")
        subdomain += "." unless subdomain.empty?
        [subdomain, request.domain, request.port_string].join
      end

      def url_for(options = nil)
        #Rails.logger.info("url_for options:#{options}")
        if options.kind_of?(Hash) && options.has_key?(:subdomain)
          options[:host] = with_subdomain(options.delete(:subdomain))
        end
        #Rails.logger.info("url_for options:#{options}")
        super
      end
    end
  end
end