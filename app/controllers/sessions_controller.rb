class SessionsController < ApplicationController
  before_action :forbid_login_user, only: [:login_form, :login]
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/foods")
    else
      @email = params[:email]
      @password = params[:password]
      @error_message = "ユーザーが存在しません。もう一度入力をご確認ください"
      render("sessions/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to(root_path)
  end
  
end
