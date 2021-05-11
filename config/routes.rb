Rails.application.routes.draw do

  get 'group_tasks/create'
  post "log_in" => "users#create_session", :as => "log_in"
  post "log_out" => "users#destroy_session", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  resources :users, :only => [:edit, :new, :show, :create, :update]
  resources :tasks, :only => [:index, :new, :create]
  resources :groups, :only => [:index, :new, :create, :show, :update]

  root "users#new"

end
