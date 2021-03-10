class Public::ItemsController < ApplicationController
  def index
    case params[:order_sort]
    when "0"
      @shop = Shop.find(params[:id])
      @items = @shop.items.page(params[:page]).order("id DESC")
      @page_title = @shop.name
    else
      @items = Item.page(params[:page]).order("id DESC")
      @page_title = "New"
    end
  end

  def new
    @item = Item.new
    @item_genres = current_user.shop.shop_genre.item_genres.all
  end

  def create
    @item = Item.new(item_params)
    @item.shop_id = current_user.shop.id
    if @item.save
      redirect_to item_path(@item)
    else
      @shop = current_user.shop
      @item_genres = @shop.shop_genre.item_genres.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item_genres = current_user.shop.shop_genre.item_genres.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      @item_genres = current_user.shop.shop_genre.item_genres.all
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to shop_path(@item.shop)
  end

  private

  def item_params
    params.require(:item).permit(:item_genre_id, :shop_id, :name, :image, :introduction, :price, :is_active)
  end
end
