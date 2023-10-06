class ArtistsController < ApplicationController
  def search
    query = params[:query]
    shazam_service = ShazamService.new
    @artist_results = shazam_service.search_artists(query)
  end

  def index
    @artists = Artist.all
    shazam_service = ShazamService.new
    @artists_sug = @artists.sample(4)
    @artists_sug.each do |artist|
      shazam_service.display_artist(artist)
    end
  end
end
