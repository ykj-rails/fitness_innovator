class WorkoutsController < ApplicationController
  before_action :set_content
  before_action :authenticate_user!

  def edit
  end

  def create
    @workouts = Workout.create
  end

  def update
    @workouts.update if @workouts.content.user_id == current_user.id
  end

  def destroy
    @workouts.destroy if @workouts.content.user_id == current_user.id
  end

  private
    def set_content
      @workouts = Content.find(params[:id])
    end

end
