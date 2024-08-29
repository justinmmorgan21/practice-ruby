# Make a Ruby script to display the current forecast (temperature min/max, description, wind speed, etc.)
# Some features to add to your weather app:
# Display other weather data (min, max, humidity, etc)
# Ask the user for the name of a city to forecast
# Ask the user for preferred temperature units (Celcius or Farenheit)
# Write the app in a loop (once you show the forecast, the user can keep entering different cities until they choose to quit the program)

require 'http'

puts "Enter the city for weather info: "
city_name = gets.chomp

city = HTTP.get("http://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&limit=5&appid=#{ENV['OPEN_WEATHER_API_KEY']}").parse
lat = city[0]["lat"]
lon = city[0]["lon"]


weather = HTTP.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=imperial").parse


condition = weather["weather"][0]["description"]
temp = weather["main"]["temp"]
humidity = weather["main"]["humidity"]
wind = weather["wind"]["speed"].to_i
wind_degrees = weather["wind"]["deg"]
sunset = weather["sys"]["sunset"]
wind_direction = "east"
puts "Right now we have #{condition} and a temperature of #{temp}\u00b0 in Frisco, Texas."

wind_direction = "north" if wind_degrees > 45 && wind_degrees < 135
wind_direction = "west" if wind_degrees >= 135 && wind_degrees < 225
wind_direction = "south" if wind_degrees >= 225 && wind_degrees < 315
puts "The current humidity is #{humidity}% and there is a breeze of #{wind}mph out of the #{wind_direction}."

puts Time.at(sunset)
sunset_clock_time = "8:00pm"
puts "Sunset tonight is at #{sunset_clock_time}"
