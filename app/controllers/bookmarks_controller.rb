class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmarks_params)

    @bookmark.list = @list

    if @bookmark.save
      redirect_to lists_new_path
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
    redirect_to lists_path
  end

  private
  def bookmarks_params
    params.require(:bookmark).permit(:comment)
  end
end
