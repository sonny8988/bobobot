require "./bobo_bot/*"
require "./bobo_bot/commands/*"

require "kemal"

# HTTP リクエストを投げて JSON を取得する


get "/" do |env|
  {bobo: "ok"}.to_json
end

post "/room_message" do |env|
  handler = BoboBot::RoomMessageHandeler.new env
  handler.respond
end


Kemal.config.port = 8080
Kemal.run
