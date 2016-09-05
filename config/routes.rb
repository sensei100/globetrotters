Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }
  resources :destinations do
    resources :reviews, :comments
  end
  resources :reviews
  resources :tips
  get 'welcome/index'

  root 'welcome#index'

 
end
