class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end
  def new
    @album = Album.new
  end
  def create
    @album = Album.new(params.require(:album).permit(:name, :photo))
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end
end
