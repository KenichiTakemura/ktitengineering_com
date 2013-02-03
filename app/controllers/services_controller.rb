class ServicesController < ApplicationController

  def view
    logger.debug("Service view l: #{I18n.locale} id: #{params[:id]}")
    @service_content = Style.get_service_content(I18n.locale.to_sym, params[:id].to_sym)
    @service_id = params[:id]
  end
end
