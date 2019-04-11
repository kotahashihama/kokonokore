class FoodsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  
  PER = 3
  
  def index
    @foods = Food.page(params[:page]).per(PER).order(created_at: :desc)
  end
  
  def show
    @food = Food.find(params[:id])
    @user = User.find_by(id: @food.user_id)
  end
  
  def new
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    @food.user_id = @current_user.id
    
    if params[:image]
      @food.image_url = "#{@food.id}.jpg"
      image = params[:image]
      File.binwrite("public/food_images/#{@food.image_url}", image.read)
    end
    
    if @food.save
      flash[:success] = "グルメを投稿しました！"
      redirect_to("/foods")
    else
      render("foods/new")
    end
  end
  
  def edit
    @food = Food.find(params[:id])
  end
  
  def update
    @food = Food.find(params[:id])
    @food.name = params[:name]
    @food.shop_name = params[:shop_name]
    @food.description = params[:description]
    
    if params[:image]
      @food.image_url = "#{@food.id}.jpg"
      image = params[:image]
      File.binwrite("public/food_images/#{@food.image_url}", image.read)
    end
    
    if @food.save
      flash[:success] = "グルメを更新しました。"
      redirect_to("/foods")
    else
      render("foods/edit")
    end
  end
  
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = "グルメを削除しました。"
    redirect_to("/foods")
  end
  
  private
  
    def ensure_correct_user
      @food = Food.find(params[:id])
      if @current_user && @food.user_id != @current_user.id
        flash[:danger] = "権限がありません"
        redirect_to("/foods")
      end
    end
    
    def food_params
      params.require(:food).permit(:name, :shop_name, :description ,:picture)
    end
end
