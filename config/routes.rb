Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  
  root to: "welcome#index"
  resources :users, only: [:index, :show, :new] do
    resources :categories, only: [:new, :create, :show, :index, :destroy]
    resources :payments, only: [:new, :create, :index, :show, :destroy]
  end
end
