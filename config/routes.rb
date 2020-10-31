Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: :json } do
    namespace :v1 do
     resources :categories, only: [ :index, :create]
     resources :ideas, only: [ :index, :create]
    end
  end
end
