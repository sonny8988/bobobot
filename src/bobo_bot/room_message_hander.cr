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
      BoboBot::MessageParser
        .new(@message)
        .command_from_message
        .respond_to @message
        .to_json
    end
  end
end
