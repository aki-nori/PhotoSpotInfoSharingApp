class WentToGosController < ApplicationController

  before_action :authenticate_user!
  before_action :set_place

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
