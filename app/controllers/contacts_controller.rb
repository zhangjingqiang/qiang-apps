class ContactsController < ApplicationController
  
  def index
  end
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.notice_email(@contact).deliver
        format.html { redirect_to contacts_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
