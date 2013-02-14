class ContactsController < ApplicationController

  layout "smart/application", :only => [:new]

  def lodge
    @contact = Contact.new
    @service_id = params[:id]
    @contact.contact_type = @service_id
    @device = params[:device].presence || "pc"
  end
  
  def new
    @space = KtitEngineering.public.first
    @client = Client.find_by_namespace("ktit_engineering")
    @contact = Contact.new
    @service_id = params[:id]
    @contact.contact_type = @service_id
    @device = params[:device]    
  end
  
  def index
    redirect_to root_path
  end

  def create
    @contact = Contact.new(params[:contact])
    ActiveRecord::Base.transaction do
      if @contact.save
        #flash[:notice] = I18n.t("contact.thankyou") + "<br>" + I18n.t("contact.after") + "<br>" + I18n.t("contact.inquiry")
        flash[:notice] = %Q|<p>#{I18n.t("contact.thankyou")}</p><p>#{I18n.t("contact.after")}</p><p>#{I18n.t("contact.inquiry")}|
        ContactMailer.send_contact_to_admin(@contact).deliver
        ContactMailer.send_contact_to_flyer(@contact).deliver
        respond_to do |format|
          format.js
        end
      else
        @contact.errors.full_messages.each do |msg|
          logger.warn("@contact.errors: #{msg}")
        end
        respond_to do |format|
          format.js
        end
      end
    end
  end

  def smart_create
    @contact = Contact.new(params[:contact])
    ActiveRecord::Base.transaction do
      if @contact.save
        flash[:notice] = %Q|<p>#{I18n.t("contact.thankyou")}</p><p>#{I18n.t("contact.after")}</p><p>#{I18n.t("contact.inquiry")}|
        ContactMailer.send_contact_to_admin(@contact).deliver
        ContactMailer.send_contact_to_flyer(@contact).deliver
        respond_to do |format|
          format.js
        end
      else
        @contact.errors.full_messages.each do |msg|
          logger.warn("@contact.errors: #{msg}")
        end
        respond_to do |format|
          format.js
        end
      end
    end
  end
  
  protected

end