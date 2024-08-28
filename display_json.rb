# require 'http'

# response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json")

# p response.parse[0]["applicant"]

require 'uri'
require 'net/http'
require 'json'

url = URI("https://tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com/getNFLTeamRoster?teamID=6&teamAbv=CHI&getStats=true&fantasyPoints=true")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = 'ENV['RAPID_API_KEY']'
request["x-rapidapi-host"] = 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com'

response = http.request(request)

puts response.read_body.class

# json_string = '{"name": "GFG", "age": 30, "city": "Noida"}'
json_object = JSON.parse(response.read_body)
puts json_object["body"]["team"]
roster = json_object["body"]["roster"]
roster.each { |player|
  puts player["longName"]
}

puts

url = URI("https://tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com/getNFLTeamRoster?teamID=6&teamAbv=SEA&getStats=true&fantasyPoints=true")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = 'ENV['RAPID_API_KEY']'
request["x-rapidapi-host"] = 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com'

response = http.request(request)

puts response.read_body.class

# json_string = '{"name": "GFG", "age": 30, "city": "Noida"}'
json_object = JSON.parse(response.read_body)
puts json_object["body"]["team"]
roster = json_object["body"]["roster"]
roster.each { |player|
  puts player["longName"]
}
