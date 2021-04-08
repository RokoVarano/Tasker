Rails.application.routes.draw do

  resources :sessions
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"
  resources :users

end
