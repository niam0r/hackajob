require 'net/http'
require 'json'

class Solution
  def run(film, character)
    characters_from_film = []
    character_filmography = []

    uri = URI("https://challenges.hackajob.co/swapi/api/people/?search=#{character}")
    res = Net::HTTP.get(uri)
    result = JSON.parse(res)


    "#{film}: #{characters_from_film.join(', ')}; #{character_filmography.join(', ')}"
  end
end

puts Solution.new.run('Yoda')
