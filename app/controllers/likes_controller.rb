class LikesController < ApplicationController


  def create
    @content = Content.find(params[:content_id])
    @content.like_it(current_user)
  end

  def destroy
    @content = Like.find(params[:id]).content
    @content.unlike_it(current_user)
  end

end
