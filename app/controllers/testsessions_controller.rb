class TestsessionsController < ApplicationController

  def create 
    user = User.find_by(email: 'test@example.com')
    session[:user_id] = user.id
    flash[:success] = 'テストユーザーとしてログインしました'
    redirect_to user
  end

end
