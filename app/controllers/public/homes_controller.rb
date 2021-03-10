class Public::HomesController < ApplicationController
  def top
    @shops = Shop.all.order(updated_at: :desc)
  end

  def about
  end
end
