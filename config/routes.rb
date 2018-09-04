Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'videos/search', to: 'videos#search'
  # get 'videos/:id', to: 'videos#show', as: 'video'
  resources :videos, only: :show do
    resources :comments
  end
  root to: 'videos#index'


  # get ':id' always last line of roots
  get 'user/:id', to: 'users#show', as: 'user_profile'
  post 'user/recieve_interest_choices', to: 'users#recieve_interest_choices'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
