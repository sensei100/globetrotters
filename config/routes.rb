Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }
  resources :destinations do
    resources :comments, only: [:create, :destroy]
    resources :reviews
  end
  resources :reviews 
  resources :tips
  get 'welcome/index'
  root 'welcome#index'
  get '/reviews/:id/review_data', to: 'reviews#review_data'
end
