module Style

  def self.get_services
    [:webenginnering, :itconsulting, :solution, :product]
  end

  SERVICES = Webcom::Utils.new_orderd_hash
  SERVICES[:en] = {
      :webenginnering => 
    { :id => "webenginnering",
      :headline => "Web Engineering",
      :leadline => "Everything from the Web. Web Engineering for all businesses.",
      :content => Cms.service_content(:webenginnering, :en),
      :icon => "icon-globe"
    },
      :itconsulting => 
    { :id => "itconsulting",
      :headline => "IT Consulting",
      :leadline => "Your local IT consultant. We are professionals in IT.",
      :content => Cms.service_content(:itconsulting, :en),
      :icon => "icon-group"
    },
      :solution =>
    { :id => "solution",
      :headline => "Big IT solution for Small Business",
      :leadline => "Enterprise solution for Small Business.",
      :content => Cms.service_content(:solution, :en),
      :icon => "icon-lightbulb"
    },
      :product =>
    { :id => "product",
      :headline => "Web business starter product",
      :leadline => "We help you start web-based business. You are one of business owners when you have an idea.",
      :content => Cms.service_content(:product, :en),
      :icon => "icon-film"
    }
  }     

  def self.get_service(lang, service)
    SERVICES[lang][service]
  end
  
  def self.get_service_content(lang, service)
    return Cms.service_content(service, lang) if Rails.env == "development"
    SERVICES[lang][service][:content]
  end
end