DmChallenge::Application.routes.draw do
  root "welcome#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :challenges

  resources :users do
    resources :activities
  end

  get "/dashboard" => "dashboard#index"
end
