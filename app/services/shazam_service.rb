require 'httparty'
require "json"
require "open-uri"
require 'dotenv/load'
require 'nokogiri'
require 'net/http'
require 'openssl'

class ShazamService
  include HTTParty
  base_uri 'https://shazam.p.rapidapi.com'

  def initialize
    @headers = {
      'X-RapidAPI-Host' => 'shazam.p.rapidapi.com',
      'X-RapidAPI-Key' => ENV["RAPIDAPI_KEY"]
    }
  end

  def display_song(track_id)
    url = URI("https://shazam.p.rapidapi.com/songs/get-details?key=#{track_id}&locale=en-US")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["RAPIDAPI_KEY"]
    request["X-RapidAPI-Host"] = 'shazam.p.rapidapi.com'

    response = http.request(request)
    # if response == "<Net::HTTPServiceUnavailable 503 Service Temporarily Unavailable readbody=true>"
      response.read_body
    track = JSON.parse(response.read_body)

  end

  def search_music(query)
    url = URI("https://shazam.p.rapidapi.com/search?term=#{query}&locale=en-US&offset=0&limit=5")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["RAPIDAPI_KEY"]
    request["X-RapidAPI-Host"] = 'shazam.p.rapidapi.com'

    response = http.request(request)
    resp = response.read_body
  end
end

    # title: track['title'],
    # subtitle: track['subtitle'],
    # cover_url: track['images']['coverart'],
    # shazam_url: track['url'],
    # genre: track['hub']['actions'][0]['name'], # Modify this to get the correct genre information
    # album: track['hub']['displayname'], # Modify this to get the correct album information
    # release_year: track['highlight']['description'], # Modify this to get the correct release year information
    # youtube_url: track['hub']['options'][0]['actions'][0]['uri'] # Modify this to get the correct YouTube URL
