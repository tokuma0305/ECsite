Rails.application.routes.draw do
  devise_for :admin
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
      get "homes/top" => "homes#top"  
  end
  scope module: :public do
      root to: 'homes#top'
      resource :end_users, only: [:show]
  end
end
