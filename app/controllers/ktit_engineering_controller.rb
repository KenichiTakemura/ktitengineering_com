class KtitEngineeringController < ApplicationController

  layout 'engineering'

  def index
    @space = KtitEngineering.public.first
    @client = Client.find_by_namespace("ktit_engineering")
    logger.debug("Client: #{@client} space: #{@space}")
  end
  
  def service_view
    @service = Service.find(params[:id])
  end
  
end
