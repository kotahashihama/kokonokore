class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: @current_user.id, food_id: params[:food_id])
    @like.save
    redirect_to("/foods/#{params[:food_id]}")
  end
  
  def destroy
    @like = Like.find_by(user_id: @current_user.id, food_id: params[:food_id])
    @like.destroy
    redirect_to("/foods/#{params[:food_id]}")
  end
end
