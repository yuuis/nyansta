Rails.application.routes.draw do

  get "/" => "cat#index"
  get "/cat/:id" => "cat#detail"

  get "/cat/prefucture/:prefucture" => "cat#search"
  get "/cat/cafe/:cafe_id" => "cat#search"
  get "/cat/breed/:breed_id" => "cat#search"
  get "cat/age/:age" => "cat#search"

  get "/cat/:prefucture/:breed_id" => "cat#search_for_prefucture_and_breed"
  
end
