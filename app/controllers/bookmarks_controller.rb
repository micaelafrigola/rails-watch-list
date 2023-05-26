class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: "Bookmark added successfully."
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to @list, notice: "Bookmark deleted successfully."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
