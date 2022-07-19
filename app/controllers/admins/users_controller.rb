class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_comments = @user.post_comments
  end

  def hide
		@user = User.find(params[:id])
		#is_deletedカラムにフラグを立てる(defaultはfalse)
    	@user.update(is_deleted: true)
    	#ログアウトさせる
    	reset_session
    	flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    	redirect_to root_path
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password)
  end

end
