class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @relationship = Relationship.new(following_id: params[:user_id], follower_id: current_user.id)
    @relationship.save
    @user = User.find(params[:user_id])
  end

  def destroy
    @relationship = Relationship.find_by(following_id: params[:user_id], follower_id: current_user.id)
    @relationship.delete
    @user = User.find(params[:user_id])
end

  private

end
