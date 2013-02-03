class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :hit, :preferred_locale
  rescue_from Webcom::Exceptions::NotFoundError, :with => :record_not_found
  def hit
    key = Webcom::DateUtil.today
    return if request.remote_ip.eql?(KtitengineeringCom::Application.config.my_host)
    unless session[key.to_sym]
      daily_hit = Rails.cache.read(:daily_hit).presence || 0
      Rails.cache.write(:daily_hit, daily_hit + 1);
      session[key.to_sym] = true
    end
    Rails.logger.debug("daily_hit: #{Rails.cache.read(:daily_hit)}")
  end
  
  def preferred_locale
    logger.debug("user_preferred_languages : #{request.user_preferred_languages}")
    user_locale = request.preferred_language_from(KtitengineeringCom::Application.config.available_language)
    logger.info("user_locale : #{user_locale}")
    if user_locale.present?
      if params[:locale]
        params[:locale] = user_locale
      else
        I18n.locale = user_locale
      end
    end
  end
  
  protected
  
  def record_not_found
    render :file => File.join("#{Rails.root}", 'public', '404.html'), :layout => false, :status => 404
  end
end
