class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image_id, :name, :name_kana, :postal_code, :address, :telephone_number, :is_active, :point])
  end
end
