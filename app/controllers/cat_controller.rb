require "json"

class CatController < ApplicationController

  def index
    @cats = Cat.all
  end

  def detail 
    @cat = Cat.find_by(id: params[:id])
    @cafe = Cafe.find_by(id: @cat.cafe_id)
    @breed = Breed.find_by(id: @cat.breed_id)
  end

  def create
    
  end

  def search
    @cafe = Cafe.where(prefucture: params[:prefucture])
    @cats = Cat.where(cafe_id: @cafe.ids)
    render :index
  end

end
