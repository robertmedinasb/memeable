# frozen_string_literal: true

Rails.application.routes.draw do

  # get 'user_profiles/votes', to: 'user_profiles#popularity'
  devise_for :users
  resources :comments
  resources :memes
  resources :categories
  get 'user_profiles', to: 'user_profiles#show'
  get 'vote/:id', to: 'memes#vote'
  get '/bycategory', to: 'memes#bycategory'
  get '/popularity', to: 'memes#popularity'
  root to: 'memes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
