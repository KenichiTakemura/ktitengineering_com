# -*- coding: utf-8 -*-
module Style

  def self.get_services
    [:webenginnering, :itconsulting, :solution, :product]
  end

  SERVICES = Webcom::Utils.new_orderd_hash
  INFO = Webcom::Utils.new_orderd_hash

  SERVICES[:en] = {
      :webenginnering => 
    { :id => "webenginnering",
      :headline => "Web Engineering",
      :leadline => "Everything from the Web. Web Engineering for all businesses.",
      :content => {:pc => Cms.service_content(:webenginnering, :en, :pc), :phone => Cms.service_content(:webenginnering, :en, :phone)},
      :icon => "icon-globe"
    },
      :itconsulting => 
    { :id => "itconsulting",
      :headline => "IT Consulting",
      :leadline => "Your local IT consultant. We are professionals in IT.",
      :content => {:pc => Cms.service_content(:itconsulting, :en, :pc), :phone => Cms.service_content(:itconsulting, :en, :phone)},
      :icon => "icon-group"
    },
      :solution =>
    { :id => "solution",
      :headline => "Big IT solution for Small Business",
      :leadline => "Enterprise solution for Small Business.",
      :content => {:pc => Cms.service_content(:solution, :en, :pc), :phone => Cms.service_content(:solution, :en, :phone)},
      :icon => "icon-lightbulb"
    },
      :product =>
    { :id => "product",
      :headline => "Web business starter product",
      :leadline => "We help you start web-based business. You are one of business owners when you have an idea.",
      :content => {:pc => Cms.service_content(:product, :en, :pc), :phone => Cms.service_content(:product, :en, :phone)},
      :icon => "icon-film"
    }
  }     

  SERVICES[:ja] = {
      :webenginnering => 
    { :id => "webenginnering",
      :headline => "WEBエンジニアリング",
      :leadline => "すべてのビジネス、個人起業家にWEBを。WEBエンジニアリングでビジネスをもっと簡単に始める、変える。ビジネスは進化する。",
      :content => Cms.service_content(:webenginnering, :ja),
      :icon => "icon-globe"
    },
      :itconsulting => 
    { :id => "itconsulting",
      :headline => "IT コンサルティング",
      :leadline => "あなたのビジネスIT活用に関するすべての疑問、問題に答えます。",
      :content => Cms.service_content(:itconsulting, :ja),
      :icon => "icon-group"
    },
      :solution =>
    { :id => "solution",
      :headline => "個人、中小企業向けITソリューションプロバイダー",
      :leadline => "個人、中小企業のIT活用に、よりハイレベルなエンタープライズソリューションを実現します。",
      :content => Cms.service_content(:solution, :ja),
      :icon => "icon-lightbulb"
    },
      :product =>
    { :id => "product",
      :headline => "個人向けビジネススタートキットの販売",
      :leadline => "ビジネスオーナーになりたい夢をサポートします。思い立ったが今が、始めるときです。",
      :content => Cms.service_content(:product, :ja),
      :icon => "icon-film"
    }
  }     


  def self.get_service(lang, service)
    SERVICES[lang][service]
  end
  
  def self.get_service_content(lang, service, device=nil)
    return Cms.service_content(service, lang, device) if Rails.env == "development"
    if device.present?
      SERVICES[lang][service][:content][device]
    else
      SERVICES[lang][service][:content][:pc]
    end
  end
  
  KtitengineeringCom::Application.config.available_language.each do |language|
    lang = language.to_sym
    INFO[lang] = {
    :flyer_text => {:pc => Cms.flyer_text(lang, :pc), :phone => Cms.flyer_text(lang, :phone)} ,
    :about => {:pc => Cms.about(lang, :pc), :phone => Cms.about(lang, :phone)}
    }
  end
  
  def self.get_flyer_text(lang, device=nil)
    return Cms.flyer_text( lang, device) if Rails.env == "development"
    if device.present?
      INFO[lang][:flyer_text][device]
    else
      INFO[lang][:flyer_text][:pc]
    end
  end
  
  def self.get_about(lang, device=nil)
    return Cms.about( lang, device) if Rails.env == "development"
    if device.present?
      INFO[lang][:about][device]
    else
      INFO[lang][:about][:pc]
    end
  end
end