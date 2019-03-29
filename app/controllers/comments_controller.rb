class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.create(comment_params)
    @content = @comment.content
    @count = @content.comments.count
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id || @comment.content.user.id == current_user.id
    redirect_back(fallback_location: root_path)
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(content_id: params[:content_id], user_id: current_user.id)
    end
end
