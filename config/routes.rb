Rails.application.routes.draw do
  resources :users, only: :index
  resources :orgs, only: :index
end
