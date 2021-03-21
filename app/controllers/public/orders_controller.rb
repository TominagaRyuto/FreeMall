class Public::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    binding.pry
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.postal_code.slice!(3)
    @order.save
    redirect_to root_path
  end

  def new
    @order = Order.new
    @addresses = current_user.addresses
  end

  def confirm
    @sum = 0
    @cart_items = current_user.cart_items
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @shipping = params[:order][:shipping]
    if @shipping == "1"
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.name = current_user.name
    elsif @shipping == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif @shipping == "3"
      @address = Address.new
      @address.user_id = current_user.id
      @address.name = @order.name
      @address.postal_code = @order.postal_code
      @address.address = @order.address
      @address.save
    end
    @addresses = current_user.addresses
    render :new if @order.invalid?
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :address, :name, :total_payment, :shipping_cost, :payment_method, :status, :postal_code)
  end
end
