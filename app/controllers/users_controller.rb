class UsersController < ApplicationController
  before_action :set_content
  before_action :authenticate_user!, except: [:show]

  def show
    @contents = @user.contents.page(params[:page]).per(9).order('created_at DESC')
    @bookmark_contents = @user.bookmark_contents.page(params[:page]).per(9).order('created_at DESC')
  end

  def edit
    redirect_to @user unless @user.id == current_user.id
  end

  def update
    current_user.update(update_params)
    redirect_to current_user, notice: "プロフィールを編集しました"
  end

  def avatar_destroy
    @user.avatar.purge if @user.id == current_user.id
    redirect_to current_user, notice: "プロフィール写真を削除しました"
  end

  private
  def set_content
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:nickname, :profile, :email, :height, :weight, :avatar)
  end
end
