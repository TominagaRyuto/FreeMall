class Admin::ShopGenresController < ApplicationController
  def index
    @shop_genre = ShopGenre.new
    @shop_genres = ShopGenre.page(params[:page]).reverse_order
  end

  def create
    @shop_genre = ShopGenre.new(shop_genre_params)
    if @shop_genre.save
      redirect_to admin_shop_genres_path
    else
      @shop_genres = ShopGenre.all
      render :index
    end
  end

  def update
    @shop_genre = ShopGenre.find(params[:id])
    if @shop_genre.update(shop_genre_params)
      redirect_to admin_shop_genres_path
    else
      render :edit
    end
  end

  def destroy
    @shop_genre = ShopGenre.find(params[:id])
    @shop_genre.destroy
    redirect_to admin_shop_genres_path
  end

  def edit
    @shop_genre = ShopGenre.find(params[:id])
  end

  private

  def shop_genre_params
    params.require(:shop_genre).permit(:name)
  end

end
