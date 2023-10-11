class MusicsController < ApplicationController
  def show
    query = params[:query]
    shazam_service = ShazamService.new
    @music_hash = shazam_service.search_music(query)
    @music_hashed = JSON.parse(@music_hash)
    @music_results = @music_hashed['tracks']['hits']
    render 'musics/index'
  end

  def index
    @shazam_service = ShazamService.new
  end

  private

  def generate_random_track_ids(count)
    @random_track_ids = []
    count.times { @random_track_ids << rand(42_222_222..55_555_555) }
    @random_track_ids
  end
end
