module Cms
  
    def self.service_content(service, lang)
      html = ""
      t = File.open("#{Rails.root}/config/locales/#{lang}/#{service}.txt", "r:utf-8")
      html = t.read
      t.close
      html.html_safe
    end
    
    def self.about(lang)
      html = ""
      t = File.open("#{Rails.root}/config/locales/#{lang}/about.txt", "r:utf-8")
      html = t.read
      t.close
      html.html_safe
    end
  
end