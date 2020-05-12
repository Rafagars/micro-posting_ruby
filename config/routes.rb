Rails.application.routes.draw do

  root 'static_pages#home'
  resources :posts do
    resources :comments
  end
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
