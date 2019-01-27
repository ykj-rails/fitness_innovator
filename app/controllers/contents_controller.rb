class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @contents = Content.all
  end

  def show
  end

  def new
    @content = Content.new
  end


  def edit
  end

  def create
    if @content.present?
      @content = Content.create(content_params)
    else
      redirect_to action: :new
    end
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params) if @content.user_id == current_user.id
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy if @content.user_id == current_user.id
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :before_body_weight, :after_body_weight, :period).merge(user_id: current_user.id)
    end
end
