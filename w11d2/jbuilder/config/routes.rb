Rails.application.routes.draw do
  # Your routes here!
  namespace :api, defaults: { format: :json } do
    resources :guests, only: [ :index, :show] do
      resources :gifts, only: [:index]
    end
  
  resources :gifts, only: [:show]
  resources :parties, only: [:show, :index] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end


#what file does this next stuff go in? lol they created the controllers for us already we need jbuilder