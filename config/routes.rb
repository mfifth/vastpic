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
    member do
      put "like" => "pictures#upvote"
      delete "unlike" => "pictures#unvote"
      patch 'set_featured' => 'pictures#featured'
    end
  end
end
