class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end
  
  def show
    @food = Food.find(params[:id])
  end
  
  def new
    @food = Food.new
  end
  
  def create
    @food = Food.new(name: params[:name], shop_name: params[:shop_name], description: params[:description])
    if @food.save
      flash[:notice] = "投稿しました！"
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
    if @food.save
      redirect_to("/foods")
    end
  end
  
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/foods")
  end
end
