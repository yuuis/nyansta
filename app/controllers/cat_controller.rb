
class CatController < ApplicationController

  def index
    @cats = Cat.all
    @breeds = Breed.all
    @message = "すべての地域のねこたち"
  end

  def detail 
    @breeds = Breed.all
    @cat = Cat.find_by(id: params[:id])
    @cafe = Cafe.find_by(id: @cat.cafe_id)
    @breed = Breed.find_by(id: @cat.breed_id)
  end

  def create
  end

  def search
    @breeds = Breed.all

    # 県での検索
    if params[:prefucture] then
      @cafe = Cafe.where(prefucture: params[:prefucture])
      @cats = Cat.where(cafe_id: @cafe.ids)
      @message = toJP(params[:prefucture]) + "のねこたち"
      render :index
    end

    # お店での検索
    if params[:cafe_id] then
      @cafe = Cafe.find_by(id: params[:cafe_id])
      @cats = Cat.where(cafe_id: params[:cafe_id])
      @message = @cafe.name + "のねこたち"
      render :index
    end

    # 品種での検索
    if params[:breed_id] then
      @breed = Breed.find_by(id: params[:breed_id])
      @cats = Cat.where(breed_id: params[:breed_id])
      @message = @breed.name + "のねこたち"
      render :index
    end

  end

  def search_for_prefucture_and_breed
    @breeds = Breed.all

    # 県と品種での複合検索
    if params[:prefucture] && params[:breed_id] then
      @cats = Array.new()

      @breed = Breed.find_by(id: params[:breed_id])
      @cafe = Cafe.where(prefucture: params[:prefucture])
      @cats = Cat.where(cafe_id: @cafe.ids).where(breed_id: params[:breed_id])
      if(!@cats.empty?) then
        @message = toJP(params[:prefucture]) + "の" +  @breed.name + "のねこたち"
      else 
        @message = toJP(params[:prefucture]) + "の" +  @breed.name + "のねこは見つかりませんでした"
      end
      render :index
    end
  end

end
