Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :destinations do
    resources :reviews, :comments 
  end
  resources :reviews
  get 'welcome/index'


   root 'welcome#index'

 
end
