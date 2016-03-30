require "./bobo_bot/*"

require "kemal"

get "/" do |env|
  env.response.content_type = "application/json"
  {bobo: "bobo"}.to_json
end

post "/room_message" do |env|
  handler = BoboBot::RoomMessageHandeler.new env
  handler.respond
end


Kemal.config.port = 8080
Kemal.run
