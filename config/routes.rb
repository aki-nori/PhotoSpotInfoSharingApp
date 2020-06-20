Rails.application.routes.draw do

  root to: 'opens#top'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    resources :went_to_gos, only: [:index]
  end
  resources :comments
  resources :places do
    resources :posts, only: [:new]
    resources :went_to_gos, only: [:create, :destroy]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
