Rails.application.routes.draw do
  resources :comments
  root "hotels#index"
  resources :hotels

  devise_for :users
  devise_for :admin_users, path: "admin/", controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    root "home#index"
    resources :villages
    resources :districts
    resources :provincials
    resources :hotels
    resources :reviews, only: :update
  end

  resources :reviews
end
