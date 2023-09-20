class ShazamService
  include HTTParty
  base_uri 'https://shazam.p.rapidapi.com'

  def initialize
    @headers = {
      'X-RapidAPI-Host' => 'shazam.p.rapidapi.com',
      'X-RapidAPI-Key' => ENV['X-RapidAPI-Key']
    }
  end

  def search_music(query)
    response = self.class.get("/search", headers: @headers, query: { term: query })
    return [] unless response.success?

    parse_music_response(response)
  end

  def search_artists(query)
    response = self.class.get("/search", headers: @headers, query: { term: query, type: 'artist' })
    return [] unless response.success?

    parse_artist_response(response)
  end

  private

  def parse_music_response(response)
    # Parse the response to extract relevant music information
    parsed_response = response.parsed_response

    # Check if the required data is present in the response
    return [] unless parsed_response['tracks'].present?

    # Extract relevant music information
    parsed_response['tracks'].map do |track|
      {
        title: track['title'],
        subtitle: track['subtitle'],
        cover_url: track['images']['coverart'],
        shazam_url: track['url'],
        genre: track['hub']['actions'][0]['name'], # Modify this to get the correct genre information
        album: track['hub']['displayname'], # Modify this to get the correct album information
        release_year: track['highlight']['description'], # Modify this to get the correct release year information
        youtube_url: track['hub']['options'][0]['actions'][0]['uri'] # Modify this to get the correct YouTube URL
      }
    end
  end

  def parse_artist_response(response)
    artists = []
    # Parse the response to extract artist data
    # Adjust this based on the actual response structure from Shazam API
    response['artists'].each do |artist_data|
      artists << {
        name: artist_data['name'],
        composer: artist_data['composer'],
        description: artist_data['description']
      }
    end
  end
end
