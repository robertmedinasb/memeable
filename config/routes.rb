Rails.application.routes.draw do
  resources :comments
  resources :memes
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'memes#index'
end
