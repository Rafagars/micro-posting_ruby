Rails.application.routes.draw do

  get 'likes/create'
  root 'static_pages#home'
  resources :posts do
    resources :comments
    resources :likes
  end
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :room_messages
  resources :rooms
end
