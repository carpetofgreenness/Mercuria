Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :jobs
  resources :users, only: [:show]
  resources :boats
  resources :boat_jobs
  
  root 'jobs#index'
  get 'pages/home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
