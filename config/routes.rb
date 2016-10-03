Rails.application.routes.draw do
  devise_for :users
  root 'pictures#index'
  get '/license', to: 'pictures#license'
  
  namespace :admin do
    resources :users, :pictures
    root 'application#index'
  end

  resources :users, only: [:show, :edit, :update]
  resources :pictures do 
    resources :likes, only: [:create, :destroy]
  end
end
