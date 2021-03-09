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
      redirect_to shop_path(@shop)
    else
      render :store
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = current_user.shop
    @shop_genres = ShopGenre.all
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      @user = current_user
      @user.update(shop_active: false)
      redirect_to shops_store_path
    else
      @shop_genres = ShopGenre.all
      render :new
    end
  end

  def destroy
     @shop = current_user.shop
     @shop.destroy
     @user = current_user
     @user.update(shop_active: true)
     redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_genre_id, :name, :introduction, :prefectures, :address, :official_hp, :image)
  end
end
