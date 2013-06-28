DmChallenge::Application.routes.draw do
  root "dashboard#index"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :challenges

  resources :users do
    resources :activities
  end

  get "/dashboard" => "dashboard#index"
end
