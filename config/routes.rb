Rails.application.routes.draw do
  resources :invoices
  resources :marinas
  resources :boats
  root 'static_pages#home'
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
