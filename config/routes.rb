DmChallenge::Application.routes.draw do
  root "/dashboard"
  resources :users

  resources :challenges

  get "/dashboard" => "dashboard#index"
end
