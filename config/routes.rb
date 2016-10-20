Rails.application.routes.draw do

  resources :villages
  resources :districts
  resources :provincials
  resources :hotels

  devise_for :admin_users, path: "admin/", controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    root "home#index"
    resources :villages
    resources :districts
    resources :provincials
    resources :hotels
  end

end
