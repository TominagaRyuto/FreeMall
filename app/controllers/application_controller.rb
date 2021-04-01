class ApplicationController < ActionController::Base
  $tax_rate = 1.1

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,except: [:top]


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :name, :name_kana, :postal_code, :address, :telephone_number, :is_active, :point])
  end
end
