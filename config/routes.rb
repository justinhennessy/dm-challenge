DmChallenge::Application.routes.draw do
  root "dashboard#index"

  resources :challenges
  
  resources :users do
    resources :activities
  end

  get "/dashboard" => "dashboard#index"
end
