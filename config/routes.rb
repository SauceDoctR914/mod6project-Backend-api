Rails.application.routes.draw do
#   scope '/api' do
#   # Home controller routes.
#
#
# end
  namespace :api do
    post   'user_token'      => 'user_token#create'
    # post 'user_token' => 'user_token#create'
    namespace :v1 do
      resources :users
      resources :notes
      resources :notebooks
      root   'user_home#index'
      get    'auth'            => 'user_home#auth'
    end
  end
end
