Rails.application.routes.draw do
  resources :asets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "asets#index"
end
