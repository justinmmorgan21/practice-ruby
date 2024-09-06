# require 'http'

# response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json")

# p response.parse[0]["applicant"]

# ALL NFL ROSTERS REQUEST

# require 'uri'
# require 'net/http'
# require 'json'

# def team_info(team_name)

# url = URI("https://tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com/getNFLTeamRoster?teamID=6&teamAbv=#{team_name}&getStats=true&fantasyPoints=true")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = 'ENV['RAPID_API_KEY']'
# request["x-rapidapi-host"] = 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com'

# response = http.request(request)


# json_object = JSON.parse(response.read_body)
# puts json_object["body"]["team"]
# roster = json_object["body"]["roster"]
# positions = {
#   QB: [],
#   WR: [],
#   RB: [],
#   TE: [],
#   K: []
# }
# roster.each { |player|
#   case player["pos"]
#   when "QB"
#     positions[:QB] << player["longName"]
#   when "WR"
#     positions[:WR] << player["longName"]
#   when "RB"
#     positions[:RB] << player["longName"]
#   when "TE"
#     positions[:TE] << player["longName"]
#   when "PK"
#     positions[:K] << player["longName"]
#   end
#   if player["stats"]["fantasyPointsDefault"]["PPR"].to_f > 60.0 && player["pos"] == "WR"
#     puts "#{player["longName"]} #{player["stats"]["fantasyPointsDefault"]["PPR"]}"
#   end
# }
# # pp positions
# puts
# end

# teams = ["BUF", "MIA", "NE", "NYJ", "DAL", "NYG", "PHI", "WAS", "BAL", "CIN", "CLE", "PIT", "CHI", "DET", "GB", "MIN", "HOU", "IND", "JAX", "TEN", "ATL", "CAR", "NO", "TB", "DEN", "KC", "LV", "LAC", "ARI", "LAR", "SF", "SEA"]
# # teams.each { |team|
# #   team_info(team)
# # }
# team_info("SEA")



# POINTS PROJECTIONS REQUEST

class Player
  attr_accessor :name, :team, :position, :points
  def initialize(name, team, position, points)
    @name = name
    @team = team
    @position = position
    @points = points
  end
  def to_s
    "#{@name}\t\t#{@team}\t\t#{@position}\t\t#{@points}"
  end
end


require 'uri'
require 'net/http'
require 'json'

url = URI("https://tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com/getNFLProjections?week=season&archiveSeason=2024&twoPointConversions=2&passYards=.04&passAttempts=-.5&passTD=4&passCompletions=1&passInterceptions=-2&pointsPerReception=1&carries=.2&rushYards=.1&rushTD=6&fumbles=-2&receivingYards=.1&receivingTD=6&targets=.1&fgMade=3&fgMissed=-1&xpMade=1&xpMissed=-1")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = ENV['RAPID_API_KEY']
request["x-rapidapi-host"] = 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com'

response = http.request(request)
json_object = JSON.parse(response.read_body)

positions = {
  QB: [],
  WR: [],
  RB: [],
  TE: []
}
   
json_object["body"]["playerProjections"].each { |player|
  data = player[1]
  player_obj = Player.new(data["longName"], data["team"], data["pos"], data["fantasyPoints"])
  case data["pos"]
    when "QB"
      positions[:QB] << player_obj
    when "WR"
      positions[:WR] << player_obj
    when "RB"
      positions[:RB] << player_obj
    when "TE"
      positions[:TE] << player_obj
  end
}

positions.each { |pos, players|  
  players.sort_by! { |player| player.points.to_f }.reverse!
  puts "**************************#{pos}***********************************"
  puts players
}