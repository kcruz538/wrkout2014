class AlbumsController < ApplicationController

  before_action do
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def index
    @albums = Album.all
    @albums = @albums.search(params[:search]) if params[:search].present?
  end

  def tagged
    @albums = Album.tagged_with(params[:tag_name])
    render :index
  end

  def new
    @album = current_user.albums.new
  end
  def create
    @album = Album.new(params.require(:album).permit(:name, :photo, :post, :user_id, :tag_list))
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end
end
