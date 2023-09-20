# Define a method to create artists
def create_artists(query)
  shazam_service = ShazamService.new
  artists_data = shazam_service.search_artists(query)

  artists_data.each do |artist_data|
    Artist.create(artist_data)
  end
end

# Seed artists
artist_queries = ['artist1', 'artist2', ..., 'artist20']
artist_queries.each do |query|
  create_artists(query)
end

