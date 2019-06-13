class LoginController < ApplicationController

  def index
  end

  def auth
    binding.pry
    usr = User.find_by(username: params[:user_name])
    if usr && usr.authenticate(params[:password])
      reset_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザー名/パスワードが間違っています。'
      render 'index'
    end
  end
end
