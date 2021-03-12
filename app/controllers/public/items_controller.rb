class Public::ItemsController < ApplicationController
  def index
    # 遷移元により@itemsに渡す値とページタイトルを変動させる為、繊維元のリンクに値を持たせ条件分岐
    case params[:order_sort]
    when "0"
      @shop = Shop.find(params[:id])
      @items = @shop.items.order("id DESC")
      @page_title = @shop.name
    when "1"
      @user = current_user
      @items = @user.like_items.order("id DESC")
      @page_title = "Like"
    else
      @items = Item.order("id DESC")
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
    @cart_item = CartItem.new
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
    params.require(:item).permit(:item_genre_id, :shop_id, :name, :image, :introduction, :price, :is_active, :stock)
  end
end
