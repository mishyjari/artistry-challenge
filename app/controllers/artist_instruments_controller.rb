class ArtistInstrumentsController < ApplicationController
  def new
    @artist_instrument = ArtistInstrument.new
    render 'new'
  end

  def create
    @artist_instrument = ArtistInstrument.new(artist_instrument_params)
    if @artist_instrument.save
      artist = Artist.find(@artist_instrument[:artist_id])
      redirect_to artist_path(artist)
    else
      flash[:err] = @artist_instrument.errors.full_messages
      redirect_to new_artist_instrument_path
    end
  end

  private

    def artist_instrument_params
      params.require(:artist_instrument).permit(:artist_id, :instrument_id)
    end
end
