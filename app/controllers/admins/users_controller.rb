class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!, except: :hide

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @post_comments = @user.post_comments.page(params[:page]).per(5)
  end

  def hide
		@user = User.find(params[:id])
		#is_deletedカラムにフラグを立てる(defaultはfalse)
  	@user.update(is_deleted: true)
  	#ログアウトさせる
  	reset_session
  	flash[:notice] = "退会処理済み"
  	redirect_to root_path
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password)
  end

end
