Rails.application.routes.draw do
  root 'home#index'
  resources :posts do
    resources :comments, :only => [:new, :create, :edit, :update, :destroy]
  end


  devise_for :users
end
