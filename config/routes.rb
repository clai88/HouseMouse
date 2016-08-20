Rails.application.routes.draw do

  devise_for :users
  resources :house

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'house#new'
end