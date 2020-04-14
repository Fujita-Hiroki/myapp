class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "質問をしました"
      redirect_to root_url
    else
      @feed = []
      render 'microposts/new'
    end
  end

  def edit
    @micropost = current_user.microposts.find_by(id: params[:id]) || nil
    if @micropost.nil?
        flash[:warning] = "編集権限がありません"
        redirect_to root_url
    end
  end

  def update
    @micropost = current_user.microposts.find_by(id: params[:id])
    @micropost.update_attributes(micropost_params)
    if @micropost.save
        flash[:success] = "編集が完了しました"
        redirect_to current_user
    else
        render 'microposts/edit'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "質問が削除されました"
    redirect_to current_user
  end

  private
    def micropost_params
      params.require(:micropost).permit(:understanding, :problem, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end