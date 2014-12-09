class AlbumsController < ApplicationController
  # include PublicActivity::Model
  # tracked
  before_action :authenticate_user!, only: [:vote]

  before_action do

    @tags = ActsAsTaggableOn::Tag.most_used

  end

  def index

    @albums = Album.all.order("likes DESC")

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

    @album = Album.new(params_album)

    if @album.save

      redirect_to root_path

    else

      render :new

    end

  end

  def vote

    @album = Album.find(params[:id])

    @album.likes += 1

    @album.save

    redirect_to user_path(@album.user_id)

  end

  def public
    @album = Album.all
  end



  def private
  end

  def params_album

    params.require(:album).permit(:name, :photo, :post, :user_id, :tag_list, :likes)

  end
end
