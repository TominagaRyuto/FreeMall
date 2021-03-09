class Public::ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @shop_genres = ShopGenre.all
  end
end
