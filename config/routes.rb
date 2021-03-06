Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/index' => 'welcome#index'
  get '/windows' => 'windows#index'
  get '/sites' => 'sites#index'
  get 'api/sites/:id', to: 'sites#api_show'
  get 'sites/:id/next', to: 'sites#next'
  root 'welcome#about'

  resources :users do
    collection do
      get :active
    end
  end
  resources :sites do
    collection do
      get :recent
      get :active
    end
    resources :windows
    resources :user_comments
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
