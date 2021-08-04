Rails.application.routes.draw do
  root 'top#index'
  get 'about', to: 'top#about'

  resources :members do
    get 'search', on: :collection
  end

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :account, only: %i[show edit update]
  resource :password, only: %i[show edit update]
end
