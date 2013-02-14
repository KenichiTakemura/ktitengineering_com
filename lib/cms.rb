module Cms
  
    def self.service_content(service, lang, device=nil)
      html = ""
      if device.present?
        t = File.open("#{Rails.root}/config/locales/#{lang}/#{device}/#{service}.txt", "r:utf-8")
      else
        t = File.open("#{Rails.root}/config/locales/#{lang}/pc/#{service}.txt", "r:utf-8")
      end
      html = t.read
      t.close
      html.html_safe
    end
    
    def self.about(lang, device=nil)
      html = ""
      if device.present?
        t = File.open("#{Rails.root}/config/locales/#{lang}/#{device}/about.txt", "r:utf-8")
      else
        t = File.open("#{Rails.root}/config/locales/#{lang}/pc/about.txt", "r:utf-8")
      end
      html = t.read
      t.close
      html.html_safe
    end
    
    def self.flyer_text(lang, device=nil)
      html = ""
      if device.present?
        t = File.open("#{Rails.root}/config/locales/#{lang}/#{device}/flyer.txt", "r:utf-8") 
      else
        t = File.open("#{Rails.root}/config/locales/#{lang}/pc/flyer.txt", "r:utf-8")
      end
      html = t.read
      t.close
      html.html_safe
    end
  
end