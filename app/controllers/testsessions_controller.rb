class TestsessionsController < ApplicationController

  def create 
    user = User.find_by(email: 'test@example.com')
    log_in user
    flash[:success] = 'テストユーザーとしてログインしました'
    redirect_to user
  end

end
