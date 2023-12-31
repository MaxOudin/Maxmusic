class MusicsController < ApplicationController
  def show
    @music_array = []
    @query = params[:query]
    @query = nil ? 'kiss the rain' : params[:query]
    @shazam_service = ShazamService.new
    @music_hash = @shazam_service.search_music(@query)
    @music_hashed = JSON.parse(@music_hash)
    render 'musics/index'
  end

  def index
    @music_array = []
    @query = params[:query]
    @query = 'nil' ? 'kiss the rain' : params[:query]
    @shazam_service = ShazamService.new
    @music_hash = @shazam_service.search_music(@query)
    @music_hashed = JSON.parse(@music_hash)
  end
end
