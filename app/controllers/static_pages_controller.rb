class StaticPagesController < ApplicationController
  def home
    @feed = params[:tag_id].present? ? Tag.find(params[:tag_id]).microposts : Micropost.all
    @feed = @feed.all.page(params[:page])
  end

  def about
  end
end
