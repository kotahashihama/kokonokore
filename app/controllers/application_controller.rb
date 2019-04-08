class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    unless @current_user
      flash[:warning] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:warning] = "すでにログインしています"
      redirect_to("/users/#{@current_user.id}")
    end
  end
end
