Rails.application.routes.draw do
  resources :drinks
  resources :users
  root :to => redirect("/users")
  resources :operations do
    collection do
      get 'add'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
