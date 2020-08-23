Rails.application.routes.draw do
  namespace :admin do
      get "homes/top" => "homes#top"
      resources :end_users, only: [:index]
  end
  scope module: :public do
      root to: 'homes#top'
      resource :end_users, only: [:show, :edit,:update]
      get "end_users/confirm" => "end_users#confirm"
      put "/end_users/confirm" => "end_users#deleted"
  end
    devise_for :end_users
    devise_for :admin
end
