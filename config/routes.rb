Rails.application.routes.draw do

  post "log_in" => "users#create_session", :as => "log_in"
  post "log_out" => "users#destroy_session", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"
  resources :users

end
