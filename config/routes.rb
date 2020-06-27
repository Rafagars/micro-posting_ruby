Rails.application.routes.draw do
  root 'static_pages#home'
  scope "(:locale)", locale: /en|es/ do
    get 'likes/create'
    resources :posts do
      resources :comments do
        resources :hearts
      end
      resources :likes
    end

    devise_for :users
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :room_messages
    resources :rooms
  end
end
