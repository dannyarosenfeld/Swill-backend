Rails.application.routes.draw do


  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'verify'  => 'sessions#verify_access_token'
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  root 'welcome#welcome'

  namespace :api do
    post 'userfavorites' => 'userfavorites#create'
    get 'favorites' => 'favorites#show'
    post 'favorites' => 'favorites#create'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    resources :users, param: :access_token
    resources :password_resets, only: [:new, :create, :edit, :update]
  end

end
