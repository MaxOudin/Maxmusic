class MusicsController < ApplicationController
  def search
    query = params[:query]
    shazam_service = ShazamService.new
    @music_results = shazam_service.search_music(query)
  end

  def index
    @shazam_service = ShazamService.new
    @music_results = generate_random_track_ids(2)
    @music = ""
  end

  private

  def generate_random_track_ids(count)
    @random_track_ids = []
    count.times { @random_track_ids << rand(10_000_000..55_555_555) }
    @random_track_ids
  end
end
