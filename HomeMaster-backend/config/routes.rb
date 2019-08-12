Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :users
        resources :homes
        post '/login', to: 'auth#create'
        get '/validate', to: 'auth#validate'
        get '/data', to: 'auth#data'
        # resources :bills
        resources :billsplits
        resources :tasks
        resources :essentials
    end
  end
end
