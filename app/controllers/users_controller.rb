class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
      )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました！"
      redirect_to("/foods")
    else
      render("users/new")
    end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
      )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/foods")
    else
      @email = params[:email]
      @password = params[:password]
      @error_message = "ユーザーが存在しません。もう一度入力をご確認ください"
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to(root_path)
  end
  
end
