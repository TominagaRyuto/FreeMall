class Admin::ItemGenresController < ApplicationController
  def index
    @item_genre = ItemGenre.new
    @item_genres = ItemGenre.page(params[:page]).reverse_order
    @shop_genres = ShopGenre.all
  end

  def create
    @item_genre = ItemGenre.new(item_genre_params)
    if @item_genre.save
      redirect_to admin_item_genres_path
    else
      @item_genres = ItemGenre.all
      @shop_genres = ShopGenre.all
      render :index
    end
  end

  def edit
    @item_genre = ItemGenre.find(params[:id])
  end

  def update
    @item_genre = ItemGenre.find(params[:id])
    if @item_genre.update(item_genre_params)
      redirect_to admin_item_genres_path
    else
      render :edit
    end
  end

  def destroy
    @item_genre = ItemGenre.find(params[:id])
    @item_genre.delete
    redirect_to admin_item_genres_path
  end

  private

  def item_genre_params
    params.require(:item_genre).permit(:shop_genre_id, :name)
  end
end
