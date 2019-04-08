class UsersController < ApplicationController
  before_action :forbid_login_user, only: [:new, :create, :login_form, :login]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @foods = Food.all.order(created_at: :desc)
    @likes = Like.where(user_id: params[:id])
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
      flash[:success] = "ユーザー登録が完了しました！"
      redirect_to("/foods")
    else
      render("users/new")
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.description = params[:description]
    @user.password = params[:password]
    
    if params[:image]
      @user.image_url = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_url}", image.read)
    end
    
    if @user.save
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
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
      flash[:success] = "ログインしました"
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
