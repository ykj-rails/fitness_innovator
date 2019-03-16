class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment.destroy if @comment.user_id == current_user.id
    redirect_back(fallback_location: root_path)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text).merge(content_id: params[:content_id], user_id: current_user.id)
    end
end
