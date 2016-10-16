Rails.application.routes.draw do
  devise_for :users
  get 'static/home'

  root :to => "static#home"
  resources :comments
  resources :events
  resources :joins
  resources :pins
  resources :places
  resources :user_profs
  get 'check_user_prof', to: 'user_profs#check'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
