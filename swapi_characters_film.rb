require 'net/http'
require 'json'

class Solution # :nodoc:
  BASE_URL = 'https://challenges.hackajob.co/swapi/api'.freeze

  def run(film, character)
    characters = get_characters(film).sort
    filmography = get_films(character).sort

    filmography << 'none' if filmography.empty?
    "#{film}: #{characters.join(', ')}; #{character}: #{filmography.join(', ')}"
  end

  def get_characters(film)
    characters = []
    uri = URI("#{BASE_URL}/films/?search=#{film}")
    result = JSON.parse(Net::HTTP.get(uri))
    result['results'][0]['characters'].each do |url|
      characters << JSON.parse(Net::HTTP.get(URI(url)))['name']
    end
    characters
  end

  def get_films(character)
    films = []
    uri = URI("#{BASE_URL}/people/?search=#{character}")
    result = JSON.parse(Net::HTTP.get(uri))
    return films if result['results'].empty?

    result['results'][0]['films'].each do |url|
      films << JSON.parse(Net::HTTP.get(URI(url)))['title']
    end
    films
  end
end

puts Solution.new.run("The Force Awakens", "Poggle the Lesser")
# puts Solution.new.run("The Force Awakens", "Walter White")
