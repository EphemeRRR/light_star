Rails.application.routes.draw do
  devise_for :users
  get 'videos/:id', to: 'videos#show', as: 'video'
  get 'videos/search', to: 'videos#search'
  root to: 'videos#index'

  # get ':id' always last line of roots
  get 'user/:id', to: 'users#show', as: 'user_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
