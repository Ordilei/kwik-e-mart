KwikEMart::Application.routes.draw do
  root :to => "produtos#index"
  
  get "/signup", :to => "users#new"
  post "/signup", :to => "users#create"

  get "/login", :to => "sessions#new", :as => "sign_in"
  post "/login", :to => "sessions#create", :as => false

  get "/logout", :to => "sessions#destroy"

end
