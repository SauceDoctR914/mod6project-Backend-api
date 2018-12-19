Rails.application.routes.draw do
  scope '/api' do
  # Home controller routes.
  root   'user_home#index'
  get    'auth'            => 'user_home#auth'
  # Get login token from Knock
  post   'user_token'      => 'user_token#create'
  # User actions
  # get    '/users'          => 'users#index'
  # get    '/users/current'  => 'users#current'
  # post   '/users/create'   => 'users#create'
  # patch  '/user/:id'       => 'users#update'
  # delete '/user/:id'       => 'users#destroy'
end
  namespace :api do
    # post 'user_token' => 'user_token#create'
    namespace :v1 do
    resources :users
    resources :notes
    resources :notebooks
  end
end
end
