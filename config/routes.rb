DmChallenge::Application.routes.draw do
  resources :challenges

  get "/dashboard" => "dashboard#index"
end
