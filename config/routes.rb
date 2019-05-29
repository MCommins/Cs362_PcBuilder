Rails.application.routes.draw do
  resources :computers
  resources :parts
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
