class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    @categories = Category.all
  end

  def create
    place = Place.new(place_params)
    place.created_by = current_user.id
    place.is_delete = false
    place.save
    redirect_to place_path(place)
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    place = Place.find(params[:id])
    place.update!(post_params)
    redirect_to place_path(place)
  end

  def destroy

  end

  private

  def place_params
    params.require(:place).permit(:name, :geocode, :infomation, :address, :is_delete, :created_by, :category_id, {images: []})
  end
end
