class WentToGosController < ApplicationController

  before_action :authenticate_user!
  before_action :set_place

  # 行ってみたいスポット
  def index
    @user = User.find(params[:user_id])
    went_to_gos = user.went_to_gos
    @places = Place.where(id: went_to_gos.map{|go| go.place_id})

    @posts_data_arr = []
    @places.each do |place|
      @posts_data_arr.push({:id => place.id, :name => place.name, :lat => place.latitude, :lng => place.longitude})
    end
    @posts_data_json = @posts_data_arr.to_json.html_safe
  end

  def create
    @went_to_go = WentToGo.create(user_id: current_user.id, place_id: params[:place_id])
    @went_to_gos = WentToGo.where(place_id: params[:place_id])
    @place.reload
  end

  def destroy
    went_to_go = WentToGo.find_by(user_id: current_user.id, place_id: params[:place_id])
    went_to_go.destroy
    @went_to_gos = WentToGo.where(place_id: params[:place_id])
    @place.reload
  end

  private

  def set_place
    @place = Place.find_by(id: params[:place_id])
  end

end
