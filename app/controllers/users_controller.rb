class UsersController < ApplicationController
  before_action :set_content
  before_action :authenticate_user!, except: [:show]

  def show
    @contents = @user.contents
  end

  def edit
    redirect_to @user unless @user.id == current_user.id
  end

  def update
    current_user.update(update_params)
    redirect_to current_user
  end

  def avatar_destroy
    @user.avatar.purge if @user.id == current_user.id
    redirect_to action: :edit
  end

  private
  def set_content
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:nickname, :profile, :email, :avatar)
  end
end
