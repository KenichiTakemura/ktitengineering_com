class ContactsController < ApplicationController

  def lodge
    @contact = Contact.new
    @service_id = params[:id]
    @contact.contact_type = @service_id
    #if current_flyer
    #  @contact.user_name = current_flyer.flyer_name
    #  @contact.email = current_flyer.email
    #end
  end
  
  def index
    redirect_to root_path
  end

  def create
    @contact = Contact.new(params[:contact])
    ActiveRecord::Base.transaction do
      if @contact.save
        flash[:notice] = I18n.t("contact.thankyou") + "<br>" + I18n.t("contact.after") + "<br>" + I18n.t("contact.inquiry")
        ContactMailer.send_contact_to_admin(@contact).deliver
        ContactMailer.send_contact_to_flyer(@contact).deliver
        respond_to do |format|
          format.js
          format.json { render :json => @contact, :status => :created }
        end
      else
        @contact.errors.full_messages.each do |msg|
          logger.warn("@contact.errors: #{msg}")
        end
        respond_to do |format|
          format.js
          format.json { render :json => @contact.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  protected

end