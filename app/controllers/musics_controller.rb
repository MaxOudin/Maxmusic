class MusicsController < ApplicationController
  def search
    query = params[:query]
    shazam_service = ShazamService.new
    @music_results = shazam_service.search_music(query)
  end

  def index
    @music = ShazamService.new.search_music('query') # Replace 'query' with your desired search term
    # Process and display the @music data in your index view
    @musics = Music.all
  end
end
