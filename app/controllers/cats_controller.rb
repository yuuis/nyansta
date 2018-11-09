
class CatsController < ApplicationController
  before_action :get_breeds

  def index
    @cats = Cat.all
    @message = "すべての地域のねこたち"
  end

  def show 
    @cat = Cat.find_by(id: params[:id])
  end

  def create
  end

  def search
    @message = (params[:prefecture].present? ? Cafe.prefectures.invert[params[:prefecture].to_i] + "の" : "")
    @message << (params[:breed].present? ? Breed.find(params[:breed]).name + "の" : "")
    @cats = Cat.search_by_breed(params[:breed]).search_by_prefecture(params[:prefecture])
    @message << (@cats.present? ? "ねこたち" : "ねこは見つかりませんでした")
    render :index
  end

  private def get_breeds
    @breeds = Breed.all
  end
end
