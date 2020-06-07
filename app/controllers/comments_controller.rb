class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    @post = comment.post
    @comment = Comment.new
  end

   def destroy
    comment = Comment.find(params[:id])
    @post = comment.post
    comment.delete
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
	end
end
