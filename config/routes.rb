Rails.application.routes.draw do

  get 'group_tasks/create'
  post "log_in" => "users#create_session", :as => "log_in"
  post "log_out" => "users#destroy_session", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :tasks
  resources :groups

  root "users#new"

end
