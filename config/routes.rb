Rails.application.routes.draw do

  get "/" => "cat#index"
  get "/cat" => "cat#detail"
  get "/cat/:id" => "cat#detail"
  get "/cat_search/:prefucture" => "cat#search"
  
end
