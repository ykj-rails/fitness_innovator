class LikesController < ApplicationController

  def create
    @content = Content.find(params[:content_id])
    unless @content.like_it?(current_user)
      @content.like_it(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @content = Like.find(params[:id]).content
    if @content.like_it?(current_user)
      @content.unlike_it(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
