class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @content = Content.find(params[:content_id])
    unless @content.bookmark_add?(current_user)
      @content.bookmark_add(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @content = Bookmark.find(params[:id]).content
    if @content.bookmark_add?(current_user)
      @content.bookmark_del(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

end
