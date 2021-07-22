class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @all_bookmarks = Bookmark.all
    @bookmark = @all_bookmarks.select{ |x| x[:list_id] === @list.id }

    #select {|x| x.select { |y| y.list_id == @list.id} }
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name, photos: [])
  end

end
