class MusicsController < ApplicationController
  def index
    @music = ShazamService.new.search_music('query') # Replace 'query' with your desired search term
    # Process and display the @music data in your index view
    @musics = Music.all
  end
end
