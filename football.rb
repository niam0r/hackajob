require 'net/http'
require 'json'

class Solution
  def run(team_key)
    uri = URI('https://raw.githubusercontent.com/openfootball/football.json/master/2014-15/en.1.json')
    res_hash = JSON.parse(Net::HTTP.get(uri))
    goals = 0
    res_hash['rounds'].each do |round|
      round['matches'].each do |mtch|
        goals += mtch['score1'] if mtch['team1']['name'] == team_key
        goals += mtch['score2'] if mtch['team2']['name'] == team_key
      end
    end
    goals
  end
end

puts Solution.new.run('Arsenal')
