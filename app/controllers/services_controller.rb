class ServicesController < ApplicationController

  def view
    logger.debug("Service view l: #{I18n.locale} id: #{params[:id]}")
    @service_content = Style.get_service(I18n.locale.to_sym, params[:id].to_sym)[:content]
    @service_id = params[:id]
  end
end
