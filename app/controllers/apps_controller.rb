class AppsController < ApplicationController
  def index
    @apps = App.by_tag(params[:tag_id]).paginate(:page => params[:page])
    @tags = Tag.all
  end
end
