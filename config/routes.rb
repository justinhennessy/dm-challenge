DmChallenge::Application.routes.draw do
  resources :users

  resources :challenges

  get "/dashboard" => "dashboard#index"
end
