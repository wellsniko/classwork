Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session
  resources :subs
  resources :posts
end

  # resources :subs do
  #   resources :posts, only: [:create, :new]
  # end
  # resources :posts, except: [:create, :new]