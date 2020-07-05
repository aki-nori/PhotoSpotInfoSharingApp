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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @place = @post.place
      @places = Place.all
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])

    # 投稿のあるPlaceのみ
    @places = Place.all
    array = []
    @places.each do |place|
      array.push(place.id) if place.posts.present?
    end
    @places = @places.where(id: array)

    @place = @post.place
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      # 投稿のあるPlaceのみ
      @places = Place.all
      array = []
      @places.each do |place|
        array.push(place.id) if place.posts.present?
      end
      @places = @places.where(id: array)

      @place = @post.place

      render "edit"
    end
    
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :place_id, :comment, :date, :time, :rate, :access, :notify, :url, :camera, :tag_list, {images: []})
  end
end
