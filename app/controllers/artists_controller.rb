class ArtistsController < ApplicationController
  def search
    query = params[:query]
    shazam_service = ShazamService.new
    @artist_results = shazam_service.search_artists(query)
  end

  def index
    @artists = Artist.all
  end
end
