class CountersController < ApplicationController

  before_filter :filter
  
  def filter
    raise Webcom::Exceptions::NotFoundError.new unless request.remote_ip == KtitengineeringCom::Application.config.my_host
  end

  def batch
    begin
      response_text = flash_hit
      render :text => "#{response_text}", :status => 200
    rescue
      render :text => "NG", :status => 500
    end
  end

  private

  def flash_hit
    @daily_hit = Rails.cache.read(:daily_hit).presence || 0
    Rails.logger.info("flash_hit daily_hit: #{@daily_hit}")
    begin
      response_text = "Total #{@daily_hit} on #{Webcom::DateUtil.today}"
      Rails.cache.write(:daily_hit, 0)
    rescue
      Rails.logger.warn("Flash_hit something went wrong with #{$!}")
    end
    response_text.presence || nil
  end

end