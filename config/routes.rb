Rails.application.routes.draw do
  root :to => redirect("/users")
  resources :users
  resources :operations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
