class Public::UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :image, :name, :name_kana, :postal_code, :address, :telephone_number, :is_active, :point)
  end
end
