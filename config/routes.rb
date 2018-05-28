Rails.application.routes.draw do
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :account_activations, only: :edit
  resources :users

  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'

  post 'session/create'
  delete 'session/destroy'
  get 'session/new'

  root 'static_pages#home'
end
