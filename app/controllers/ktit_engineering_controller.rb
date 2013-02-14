class KtitEngineeringController < ApplicationController

  layout 'engineering'

  def index
    redirect_to smart_path if Webcom::Browser.phone?(request, nil)
    @space = KtitEngineering.public.first
    @client = Client.find_by_namespace("ktit_engineering")
    logger.debug("Client: #{@client} space: #{@space}")
  end
  
  def service_view
    @service = Service.find(params[:id])
  end
  
end
