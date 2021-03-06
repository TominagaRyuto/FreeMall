Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resource :users, only:[:show, :edit, :update]
  end
  devise_for :admins
  devise_for :users
end
