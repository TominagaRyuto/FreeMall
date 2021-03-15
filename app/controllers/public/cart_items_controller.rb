class Public::CartItemsController < ApplicationController
  def index
    @sum = 0
    @cart_items = current_user.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # カート内に同じ商品があった場合、数量だけ変更する処理(10~16)
    @cart_items = current_user.cart_items
    @cart_items.each do |cart_item|
      if cart_item.item.id == @cart_item.item.id
        @cart_item.amount += cart_item.amount
        cart_item.destroy
      end
    end
    @cart_item.user_id = current_user.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = @cart_item.item
      render 'public/items/show'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
