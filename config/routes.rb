Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :admins
  devise_scope :admin do
    authenticated :admin do
      root 'static_pages#home', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#home', as: :unauthenticated_root
    end
  end
  resources :invoice_items
  resources :invoices do
    get 'clone'
  end
  resources :marinas
  resources :boats
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
