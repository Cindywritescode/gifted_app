Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events
  resources :friends, except: [:edit, :update]
  resources :gifts do
    resources :gift_ideas, only: [:new, :create, :destroy]
  end
  resources :notes
end
