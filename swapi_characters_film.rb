require 'net/http'
require 'json'

class Solution
  def run(film, character)
    characters_from_film = get_characters(film)
    character_filmography = get_films(character)

    character_filmography << 'none' if character_filmography.empty?
    "#{film}: #{characters_from_film.sort.join(', ')}; #{character}: #{character_filmography.sort.join(', ')}"
  end

  def get_characters(film)
    characters = []
    uri = URI("https://challenges.hackajob.co/swapi/api/films/?search=#{film}")
    result = JSON.parse(Net::HTTP.get(uri))
    result['results'][0]['characters'].each do |url|
      characters << JSON.parse(Net::HTTP.get(URI(url)))['name']
      end
    characters
  end

  def get_films(character)
    films = []
    uri = URI("https://challenges.hackajob.co/swapi/api/people/?search=#{character}")
    result = JSON.parse(Net::HTTP.get(uri))
    return films if result['results'].empty?

    result['results'][0]['films'].each do |url|
      films << JSON.parse(Net::HTTP.get(URI(url)))['title']
    end
    films
  end
end

puts Solution.new.run("The Force Awakens", "Poggle the Lesser")
# Solution.new.run("The Force Awakens", "Walter White")

# puts Solution.new.get_name('https://challenges.hackajob.co/swapi/api/people/1/')
