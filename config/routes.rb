Rails.application.routes.draw do
  root to: "application#home"

  namespace :api do
    namespace :v1 do
      resources :logs, only: [:create] do
        get :search, on: :collection
      end
    end
  end
end
