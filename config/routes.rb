Rails.application.routes.draw do
  namespace :admin do
      get "homes/top" => "homes#top"
      resources :end_users, only: [:index]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  scope module: :public do
      root to: 'homes#top'
      resource :end_users, only: [:show, :edit,:update]
      resources :items, only: [:index, :show]
      get "end_users/confirm" => "end_users#confirm"
      put "/end_users/confirm" => "end_users#deleted"
  end
    devise_for :end_users
    devise_for :admin
end
