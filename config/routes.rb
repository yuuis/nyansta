Rails.application.routes.draw do

  get "/" => "cats#index"
  resources :cats, only: [:show] do
    get :search, on: :collection
  end

  # get "/cat/prefuscture/:prefecture" => "cat#search"
  # get "/cat/cafe/:cafe_id" => "cat#search"
  # get "/cat/breed/:breed_id" => "cat#search"
  # get "cat/age/:age" => "cat#search"

  get "/cat/:prefecture/:breed_id" => "cat#search_for_prefecture_and_breed"
  
end
