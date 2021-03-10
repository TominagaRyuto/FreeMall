module ApplicationHelper
  def resource_name
   :user
  end

  def resource
     @resource ||= User.new
  end

  def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
  end

 def TAX(price)
  @tax = ((price * 1.1).round(2)).ceil.to_s(:delimited)
  ("¥#{@tax}")
 end
end
