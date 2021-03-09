class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
    # @shop = current_user.shop
    @item_genres = current_user.shop.shop_genre.item_genres.all
  end

  def create
    @item = Item.new(item_params)
    @item.shop_id = current_user.shop.id
    if @item.save
      redirect_to items_path
    else
      @shop = current_user.shop
      @item_genres = @shop.shop_genre.item_genres.all
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_genre_id, :shop_id, :name, :image, :introduction, :price, :is_active)
  end
end
