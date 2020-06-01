# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'user_profiles/votes', to: 'user_profiles#popularity'
  devise_for :users
  resources :comments
  resources :memes
  get 'user_profiles', to: 'user_profiles#show'
  get 'vote/:id', to: 'memes#vote'
  get '/categories', to: 'memes#by_category'
  get '/popularity', to: 'memes#by_popularity'
  root to: 'memes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
