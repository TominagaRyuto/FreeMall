class Public::LikesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    like = current_user.likes.new(item_id: item.id)
    like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    item = Item.find(params[:item_id])
    like = current_user.likes.find_by(item_id: item.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end

end
