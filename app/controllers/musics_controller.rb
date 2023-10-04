class MusicsController < ApplicationController
  def search
    query = params[:query]
    shazam_service = ShazamService.new
    @music_results = shazam_service.search_music(query)
  end

  def index
    # Example: Fetching some default music data
    @music_results = [
      { title: 'Song 1', subtitle: 'Subtitle 1' },
      { title: 'Song 2', subtitle: 'Subtitle 2' }
    ]
    # @music = ShazamService.new.search_music('query')
    # @musics = Music.all
  end
end
