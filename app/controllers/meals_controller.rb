class MealsController < ApplicationController
  before_action :set_content
  before_action :authenticate_user!

  def edit
  end

  def create
    @meals = Meal.create
  end

  def update
    @meals.update if @meals.content.user_id == current_user.id
  end

  def destroy
    @meals.destroy if @meals.content.user_id == current_user.id
  end

  private
    def set_content
      @meals = Content.find(params[:id])
    end

end
