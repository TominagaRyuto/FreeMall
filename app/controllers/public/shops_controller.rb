class Public::ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @shop_genres = ShopGenre.all
  end

  def store
    @shop = current_user.shop
  end

  def update
    @shop = current_user.shop
    if @shop.update(shop_params)
      redirect_to root_path
    else
      render :store
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shops_store_path
    else
      @shop_genres = ShopGenre.all
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_genre_id, :name, :introduction, :prefectures, :postal_code, :address, :official_hp, :image)
  end
end
