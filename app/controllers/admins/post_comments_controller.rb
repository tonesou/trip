class Admins::PostCommentsController < ApplicationController
  def index
    @post_comments = PostComment.all.page(params[:page]).per(10)
  end

  def show
    @post_comment = PostComment.find(params[:id])
    @posts = @post_comment.post
  end

  def sho
    @post_comment = PostComment.find(params{:id})
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admins_post_comments_path
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :post_id)
  end
end
