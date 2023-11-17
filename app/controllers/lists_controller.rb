class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def create
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :bookmark, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
