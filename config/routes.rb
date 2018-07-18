Rails.application.routes.draw do
  resources :invoice_items
  resources :invoices do
    get 'clone'
  end
  resources :marinas
  resources :boats
  root 'static_pages#home'
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
