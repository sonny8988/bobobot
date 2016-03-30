module BoboBot
  class RoomMessageHandeler
    def initialize(env)
      @env = env
      @env.response.content_type = "application/json"
      @message = begin
                   item = @env.params.json["item"] as Hash
                   msg1 = item["message"] as Hash
                   msg1["message"] as String
                 rescue
                   ""
                 end
    end

    def respond
      cp = BoboBot::CommandParser.new @message
      BoboBot::CommandResponder.new(cp.command, cp.message).hipchat_json
    end
  end
end
