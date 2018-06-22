Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/logout' => 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/index' => 'welcome#index'
  get '/windows' => 'windows#index'
  get '/sites' => 'sites#index'
  root 'welcome#about'

  resources :users
  resources :sites do
    collection do
      get :recent
      get :active
    end
    resources :windows
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
