class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @like_count_array = @user.posts.map{|post| post.likes.count}
    @like_count = @like_count_array.sum
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def followings
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page]).per(5)
    render 'show_followings'
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page]).per(5)
    render 'show_followers'
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :address, :is_admin, :back_image)
  end
end
