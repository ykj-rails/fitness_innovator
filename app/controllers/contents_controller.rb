class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @contents = Content.page(params[:page]).per(4).order('created_at DESC').includes(:user, :comments)
    @comment = Comment.new
  end

  def show
    @comment = Comment.new
    @comments = @content.comments.includes(:user)
  end

  def new
    @content = Content.new
    @content.workouts.build
    @content.meals.build
  end

  def edit
  end

  def create
    @content = Content.create(content_params)
    redirect_to :root
  end

  def update
    @content.update(content_params) if @content.user_id == current_user.id
    redirect_to :root
  end

  def destroy
    @content.destroy if @content.user_id == current_user.id
    redirect_to :root
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(
        :title, :before_body_weight, :after_body_weight, :period, :comment, :befor_image, :after_image,
        workouts_attributes: [:id, :title, :menu, :week_id, :_destroy],
        meals_attributes: [:id, :title, :menu, :_destroy]).merge(user_id: current_user.id)
    end
end
