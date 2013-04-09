WebStore::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  resources :products do
    put 'add_to_cart'
  end

  delete "/logout", :to => "sessions#destroy"

  resources :carts
end
