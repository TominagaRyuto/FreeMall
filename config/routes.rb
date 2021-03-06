Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
    get 'addresses/edit'
  end
  scope module: :public do
    root to: 'homes#top'
      get 'about' => 'homes#about'
    resource :users, only:[:show, :edit, :update]
      get 'users/confirm' => 'users#confirm', as: 'users_confirm'
      patch 'users/cancellation' => 'users#cancellation', as: 'users_cancellation'
    
  end
  devise_for :admins
  devise_for :users
end
