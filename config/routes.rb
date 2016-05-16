Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'clients#index'

  resources :clients do
    collection { post :import}
  end

  namespace :api do
    namespace :v1 do
      resources :clients, only: [:index, :create, :show, :update, :destroy]
    end
  end

  post '/login' => 'sessions#create'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
