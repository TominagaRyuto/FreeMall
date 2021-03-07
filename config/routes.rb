Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
      get 'about' => 'homes#about'
    resource :users, only:[:show, :edit, :update]
      get 'users/confirm' => 'users#confirm', as: 'users_confirm'
      patch 'users/cancellation' => 'users#cancellation', as: 'users_cancellation'
    resources :addresses, :except =>[:show, :new]
  end

  namespace :admin do
    resources :shop_genres, :except => [:show, :new]
  end

  devise_for :admins
  devise_for :users
end
