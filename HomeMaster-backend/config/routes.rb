Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :users, only: [:create, :index]
        resources :homes, only: [:create, :index]
        post '/login', to: 'auth#create'
        get '/validate', to: 'auth#validate'
        get '/data', to: 'auth#data'
        # resources :bills
        # resources :billsplits
        # resources :tasks
        # resources :essentials
    end
  end
end
