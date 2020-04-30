class ArtistsController < ApplicationController

  # Display actions
  def index
    @artists = Artist.all
    render 'index'
  end
  def new
    @artist = Artist.new
    render 'new'
  end
  def show
    @artist = Artist.find(params[:id])
    render 'show'
  end
  def edit
    @artist = Artist.find(params[:id])
    render 'edit'
  end

  # Write routes
  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to artist_path(artist)
    else
      flash[:err] = artist.errors.full_messages
      redirect_to new_artist_path
    end
  end
  def update
    artist = Artist.find(params[:id])
    artist.assign_attributes(artist_params)
    if artist.save
      redirect_to artist_path(artist)
    else
      flash[:err] = artist.errors.full_messages
      redirect_to edit_artist_path(artist)
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :age, :title)
  end
end
