class Admin::AppsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  def index
    @apps = App.by_tag(params[:tag_id]).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @app = App.new
  end

  def edit
  end

  def create
    @app = App.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to admin_apps_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @app }
      else
        format.html { render action: 'new' }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to admin_apps_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to admin_apps_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:q]
      @apps = App.where("name LIKE ?", "%" + params[:q] + "%").paginate(:page => params[:page])
    else
      redirect_to action: index
    end
  end

  private
    def set_app
      @app ||= App.find_by(permalink: params[:id])
    end

    def app_params
      params.require(:app).permit(:name, :permalink, :description, :url, :position, :tag_list)
    end
end
