class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  def index
    @notices = Notice.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @notice = Notice.new
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to admin_notices_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @notice }
      else
        format.html { render action: 'new' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to admin_notices_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to admin_notices_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_notice
      @notice ||= Notice.find(params[:id])
    end 

    def notice_params
      params.require(:notice).permit(:title, :body)
    end
end
