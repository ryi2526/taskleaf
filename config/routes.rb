Rails.application.routes.draw do
  resources :users, only: [:edit ,:update], param: :UserID

# ユーザ作成
  get '/signup', to: 'local/users#new'

# ユーザ編集
  get '/useredit', to: 'local/users#edit'
  get '/update', to: 'local/users#update'
  patch '/update', to: 'local/users#update'
  put '/update', to: 'local/users#update'

# サインアップ  
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
