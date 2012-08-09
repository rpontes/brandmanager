Brandmanager::Application.routes.draw do
  root :to => "brands#index"

  get "/signup", :to => "users#new"
  post "/signup", :to => "users#create"

	get "/login", :to => "sessions#new"
	post "/login", :to => "sessions#create"
  get "/logout", :to => "sessions#destroy"
  
end
