class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new
    @cart_item.user_id = current_user.id
    @item = Item.find(params[:item_id])
    @cart_item.item_id = @item.id
    binding.pry
  end
end
