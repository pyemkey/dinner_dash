DinnerDash::Application.routes.draw do
  root to: 'home#show'
  devise_for :users
end
