class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :comments_show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :comments_show]

  def index
    @contents = Content.page(params[:page]).per(9).order('created_at DESC').includes(:user, :comments)
    @comment = Comment.new
  end

  def show
    @comment = Comment.new
    @comments = @content.comments.includes(:user)
  end

  def comments_show
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
    redirect_to :root, notice: "投稿しました。"
  end

  def update
    @content.update(content_params) if @content.user_id == current_user.id
    redirect_to content_path(@content), notice: "編集しました。"
  end

  def destroy
    @content.destroy if @content.user_id == current_user.id
    redirect_to :root, notice: "削除しました。"
  end

  private
    def set_content
      if Content.exists?(id: params[:id])
        @content = Content.find(params[:id])
      else
        redirect_to :root
      end
    end

    def content_params
      params.require(:content).permit(
        :before_body_weight, :after_body_weight, :period, :comment, :befor_image, :after_image,
        workouts_attributes: [:id, :title, :menu, :week_id, :_destroy],
        meals_attributes: [:id, :title, :menu, :_destroy]).merge(user_id: current_user.id)
    end
end
