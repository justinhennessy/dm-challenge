DmChallenge::Application.routes.draw do
  root "dashboard#index"

  resources :users
  resources :challenges

  get "/dashboard" => "dashboard#index"
end
