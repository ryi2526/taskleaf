Rails.application.routes.draw do
  resources :editusers, only: [:edit ,:update], param: :UserID


# ユーザ編集
  get '/editusers/:UserID', to: 'local/users#edit'
  get '/update/:UserID', to: 'local/users#update'
  patch '/update/:UserID', to: 'local/users#update'
  put '/update/:UserID', to: 'local/users#update'

# ユーザ作成
  get '/signup', to: 'local/users#new'

# サインイン 
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

# サインアウト
  delete '/signout', to: 'sessions#destroy'

  # local_users_path localがつく
  namespace :local do
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
