# require 'http'

# response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json")

# p response.parse[0]["applicant"]

require 'uri'
require 'net/http'
require 'json'

def team_info(team_name)
  url = URI("https://tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com/getNFLTeamRoster?teamID=6&teamAbv=#{team_name}&getStats=true&fantasyPoints=true")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-key"] = 'ENV['RAPID_API_KEY']'
  request["x-rapidapi-host"] = 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com'

  response = http.request(request)


  json_object = JSON.parse(response.read_body)
  puts json_object["body"]["team"]
  roster = json_object["body"]["roster"]
  positions = {
    QB: [],
    WR: [],
    RB: [],
    TE: [],
    K: []
  }
  roster.each { |player|
    case player["pos"]
    when "QB"
      positions[:QB] << player["longName"]
    when "WR"
      positions[:WR] << player["longName"]
    when "RB"
      positions[:RB] << player["longName"]
    when "TE"
      positions[:TE] << player["longName"]
    when "PK"
      positions[:K] << player["longName"]
    end
  }
  pp positions
  puts
end

teams = ["BUF", "MIA", "NE", "NYJ", "DAL", "NYG", "PHI", "WAS", "BAL", "CIN", "CLE", "PIT", "CHI", "DET", "GB", "MIN", "HOU", "IND", "JAX", "TEN", "ATL", "CAR", "NO", "TB", "DEN", "KC", "LV", "LAC", "ARI", "LAR", "SF", "SEA"]
teams.each { |team|
  team_info(team)
}

