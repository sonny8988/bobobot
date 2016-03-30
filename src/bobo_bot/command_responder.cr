module BoboBot
  # creates the response
  class CommandResponder
    def initialize(command : Symbol, message : String)
      @command = command
      @message = message
    end

    def hipchat_json
      case @command
      when BoboBot::COMMANDS[:LUNCH]
        LunchResponse.new(@message).json
      when BoboBot::COMMANDS[:UNKNOWN]
        UnknownResponse.new(@message).json
      else
        UnknownResponse.new(@message).json
      end
    end
  end
end
