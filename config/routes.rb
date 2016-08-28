Rails.application.routes.draw do

  devise_for :users

  resources :house
  delete '/userhouse/:user_id/:house_id/destroy' => 'house#destroy_search', as: 'house_destroy'

  patch '/userhouse/:user_id/:house_id/star' => 'house#star', as: 'house_star'

  patch '/userhouse/:user_id/:house_id/description' => 'house#description', as: 'house_edit'

  get '/house/:id/mortgage' => 'house#mortgage_info', as: 'house_mortgage_info'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'house#new'
end
