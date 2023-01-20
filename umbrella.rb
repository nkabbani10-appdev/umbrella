require "json"
require("open-uri")

p "where are you located?"

user_location = "Chicago"

p user_location


gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{ user_location }&key=#{ENV.fetch("GMAPS_KEY")}"

raw_data = URI.open(gmaps_url).read

parsed_data = JSON.parse(raw_data)

 results_array = parsed_data.fetch("results")

 only_result = results_array[0]

 p only_result.keys

 geo = only_result.fetch("geometry")

 loc = geo.fetch("location")

p latitude = loc.fetch("lat")
p longitude = loc.fetch("lng")


darksky_url = "https://api.darksky.net/forecast/#{ENV.fetch("DARK_SKY_KEY")}/#{ latitude },#{ longitude }"

raw_data_2 = URI.open(darksky_url).read

parsed_data_2 = JSON.parse(raw_data_2)


minutely_hash = parsed_data_2.fetch("minutely")

p hourly_weather = minutely_hash.fetch("summary")

currently_hash = parsed_data_2.fetch("currently")

p current_temperature = currently_hash.fetch("temperature").round(1)

hourly_hash = parsed_data_2.fetch("hourly")

data_array = hourly_hash.fetch("data")

hour_1_hash = data_array[1]

p precip_probability = hour_1_hash.fetch("precipProbability")
