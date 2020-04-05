Rails.application.routes.draw do
  root 'home#top'

  get 'home/about' => "home#about"
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  end
  resources :users, only: [:new, :create, :show, :index, :edit, :update] do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

end