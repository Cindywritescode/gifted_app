Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "events", to: "events#all", as: :all

  # # Sidekiq Web UI, only for admins.
  # require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq', as: 'sidekiq_web'
  # end
  resources :friends, except: [:edit, :update] do
    resources :notes, only: [:show, :create, :edit, :new]
    resources :events, except: [:show]
    resources :gift_ideas, only: [:destroy]
  end
  resources :gifts, except: [:show, :edit, :update] do
    resources :gift_ideas, only: [:new, :create, :destroy] do
      delete "remove", to: "gift_ideas#remove"
    end
  end
  resources :notes, only: [:destroy, :update]
end
