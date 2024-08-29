require 'http'

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?lat=33.21364538436966&lon=-96.86922834480542&appid=#{ENV['OPEN_WEATHER_API_KEY']}")

p response.parse

