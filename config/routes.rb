Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :players do
    collection do
      get :search_by
    end
  end
  resources :devices do
    collection do
      get :search_by
    end
  end
  resources :offers
  resources :offer_targets
  root "players#index"
end
