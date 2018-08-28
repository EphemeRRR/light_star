Rails.application.routes.draw do
  get 'videos/:id', to: 'videos#show', as: 'video'
  get 'videos/search', to: 'videos#search'
  devise_for :users
  root to: 'videos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
