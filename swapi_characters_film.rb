require 'net/http'
require 'json'

class Solution
  def run(film, character)
    characters_from_film = []
    character_filmography = []

    uri = URI("https://challenges.hackajob.co/swapi/api/films/?search=#{film}")
    result = JSON.parse(Net::HTTP.get(uri))
    characters_links = result['results'][0]['characters']
    puts characters_links

    character_filmography << 'none' if character_filmography.empty?
    "#{film}: #{characters_from_film.join(', ')}; #{character}: #{character_filmography.join(', ')}"
  end
end

Solution.new.run("The Force Awakens", "Walter White")
