
class CatsController < ApplicationController

  def index
    @cats = Cat.all
    @breeds = Breed.all
    @message = "すべての地域のねこたち"
  end

  def show 
    @breeds = Breed.all
    @cat = Cat.find_by(id: params[:id])
    @cafe = Cafe.find_by(id: @cat.cafe_id)
    @breed = Breed.find_by(id: @cat.breed_id)
    @same_breed_cats = Cat.where(breed_id: @breed.id)
    @same_cafe_cats = Cat.where(cafe_id: @cafe.id)
  end

  def create
  end

  def search
    @breeds = Breed.all
    @message = (params[:prefecture].present? ? Cafe.prefectures.invert[params[:prefecture].to_i] + "の" : "")
    @message << (params[:breed].present? ? Breed.find(params[:breed]).name + "の" : "")
    @cats = Cat.search_by_breed(params[:breed]).search_by_prefecture(params[:prefecture])
    @message << (@cats.present? ? "ねこたち" : "ねこは見つかりませんでした")
    render :index
  end
end
