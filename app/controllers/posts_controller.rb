class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @places = Place.all
    
    @place = Place.find(params[:place_id])
    @post.place_id = @place.id
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @places = Place.all
    @place = @post.place
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post_path(post)
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :place_id, :comment, :date, :time, :rate, :access, :notify, :url, :camera, {images: []})
  end
end
