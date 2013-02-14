class SmartsController < KtitEngineeringController
  
  layout "smart/application"
  
  before_filter :phone_user
  
  def phone_user
    logger.debug("phone_user")
    if Rails.env == "production"
      logger.info("Redirect to root_path")
      redirect_to root_path unless Webcom::Browser.phone?(request)
    end
  end

  def index
    @space = KtitEngineering.public.first
    @client = Client.find_by_namespace("ktit_engineering")
    logger.debug("Client: #{@client} space: #{@space}")
  end

end
