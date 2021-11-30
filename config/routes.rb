Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users

  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
  get :followings, on: :member
  get :followers, on: :member
  end

  resources :contacts, only: [:new, :create]

  get '/search', to: 'searches#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
