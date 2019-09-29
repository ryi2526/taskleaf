Rails.application.routes.draw do
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  # local_users_path localがつく
  namespace :local do
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
