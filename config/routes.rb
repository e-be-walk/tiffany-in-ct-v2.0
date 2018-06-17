Rails.application.routes.draw do

  resources :comments
  get '/signin' => 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/logout' => 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/index' => 'welcome#index'
  root 'welcome#about'


  resources :users do
    resources :sites do
      resources :windows
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
