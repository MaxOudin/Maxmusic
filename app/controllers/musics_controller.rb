class MusicsController < ApplicationController
  def search
    query = params[:query]
    shazam_service = ShazamService.new
    @music_results = shazam_service.search_music(query)
  end

  def index
    shazam_service = ShazamService.new
    @music = shazam_service.display_songs
  end
end
