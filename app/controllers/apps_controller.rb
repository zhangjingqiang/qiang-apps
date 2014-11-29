class AppsController < ApplicationController
  def index
    @apps = App.by_tag(params[:tag_id]).paginate(:page => params[:page])
    @notice = Notice.first
    @tags = Tag.all
  end
end
