module BoboBot
  # Parses the command from hipchat
  class CommandParser

    getter message, command
    def initialize(message : String)
      @message = message
      @command = command_from_message @message
    end

    private def command_from_message(msg) : Symbol
      split = msg.split
      return :unknown unless split.size > 1
      case split[1].downcase
      when "lunch"
        COMMANDS[:LUNCH]
      else
        COMMANDS[:UNKNOWN]
      end
    end
  end
end
