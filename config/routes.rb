Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :jobs
  resources :users, only: [:show]
  resources :boats
  
  root 'pages#home'
  get 'pages/home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
