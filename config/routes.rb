Rails.application.routes.draw do
  resources :animals do
    resources :sightings
  end
  
  root to: "animals#index"
end
