class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end
  
  def show
    @food = Food.find_by(id: params[:id])
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
end
