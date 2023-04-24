Rails.application.routes.draw do
  namespace :api do
    resources :users
    get "typehead/:query", to: "users#typehead"
  end
end
