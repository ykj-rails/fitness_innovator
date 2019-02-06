class UsersController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :avatar_destroy]

  def show
  end

  def edit
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
