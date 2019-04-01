require 'net/http'
require 'json'

class Solution
  def run(character)
    uri = URI("https://challenges.hackajob.co/swapi/api/people/?search=#{character}")
    res = Net::HTTP.get(uri)
    result = JSON.parse(res)
    result['results'][0]['films'].length
  end
end

puts Solution.new.run('Yoda')
