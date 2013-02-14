class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :hit, :preferred_locale, :set_locale

  rescue_from Webcom::Exceptions::NotFoundError, :with => :record_not_found

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def hit
    if !request.remote_ip.eql?(KtitengineeringCom::Application.config.my_host)
      key = Webcom::DateUtil.today
      unless session[key.to_sym]
        daily_hit = Rails.cache.read(:daily_hit).presence || 0
        remoteip_list = Rails.cache.read(:remoteip_list).presence || Hash.new
        Rails.cache.write(:daily_hit, daily_hit + 1);
        ipcount = remoteip_list[request.remote_ip.to_sym] || 0
        remoteip_list[request.remote_ip.to_sym] = (ipcount + 1)
        Rails.cache.write(:remoteip_list, remoteip_list);
        session[key.to_sym] = true
      end
      Rails.logger.debug("daily_hit: #{Rails.cache.read(:daily_hit)}")
      Rails.logger.debug("remoteip_list: #{Rails.cache.read(:remoteip_list)}")
    end

  end
  
  def preferred_locale
    logger.debug("user_preferred_languages : #{request.user_preferred_languages}")
    user_locale = request.preferred_language_from(KtitengineeringCom::Application.config.available_language)
    logger.info("user_locale : #{user_locale}")
    if user_locale.present?
      params[:locale] = params[:locale].presence || user_locale
    end
  end

  
  protected
  
  def record_not_found
    render :file => File.join("#{Rails.root}", 'public', '404.html'), :layout => false, :status => 404
  end
end
