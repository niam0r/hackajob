require 'net/http'
require 'json'

class Solution
  def run(film, character)
    characters_from_film = []
    character_filmography = []

    uri = URI("https://challenges.hackajob.co/swapi/api/films/?search=#{film}")
    result = JSON.parse(Net::HTTP.get(uri))
    characters_urls = result['results'][0]['characters']
    characters_urls.each do |url|
      res = JSON.parse(Net::HTTP.get(URI(url)))
      characters_from_film << res['name']
      character_filmography_urls = res['films']
    end



    character_filmography << 'none' if character_filmography.empty?
    "#{film}: #{characters_from_film.join(', ')}; #{character}: #{character_filmography.join(', ')}"
  end
end

puts Solution.new.run("The Force Awakens", "Walter White")
# Solution.new.run("The Force Awakens", "Walter White")

# puts Solution.new.get_name('https://challenges.hackajob.co/swapi/api/people/1/')
