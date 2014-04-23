DinnerDash::Application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :line_items
  resources :items
  resources :carts
end
