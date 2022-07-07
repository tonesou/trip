class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # binding.pry
    if @post.save
    redirect_to posts_path
    else
    render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def genre
    @post = Post.find(params[:id])
    #@genre = Genre.where(id: params[:id])
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:country, :city, :image, :explain, :genre)
  end
end
