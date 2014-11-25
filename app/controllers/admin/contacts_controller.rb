class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_contact, only: [:show, :destroy]
  
  def index
    @contacts = Contact.paginate(:page => params[:page])
  end
  
  def show
  end
  
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_contact
      @contact ||= Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
