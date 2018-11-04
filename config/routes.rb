Rails.application.routes.draw do

  get "/" => "cats#index"
  resources :cats, only: [:show] do
    get :search, on: :collection
  end
end
