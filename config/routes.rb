Rails.application.routes.draw do

  root to: 'open#top'
  

  get 'users/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :comments
  resources :places do
    resources :posts, only: [:new]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
