Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do 
      resources :games, only: [:index, :show]
    end
  end
end
