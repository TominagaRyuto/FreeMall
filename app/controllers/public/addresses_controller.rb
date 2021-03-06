class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_user.addresses.all
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses = current_user.addresses.all
      render :index
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
