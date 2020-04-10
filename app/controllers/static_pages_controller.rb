class StaticPagesController < ApplicationController
  def home
    @feed = Micropost.all.page(params[:page])
  end

  def about
  end
end
