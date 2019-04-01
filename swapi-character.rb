require 'net/http'

class Solution
    def run(character)
      # Some work here; return type and arguments should be according to the problem's requirements
      uri = URI("https://challenges.hackajob.co/swapi/api/people/?search=#{character}")
        Net::HTTP.get(uri) # => String
        numberOfFilms = nil
    return numberOfFilms
    end
end
