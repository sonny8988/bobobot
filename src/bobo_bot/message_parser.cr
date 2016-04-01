module BoboBot
  # Parses the command from hipchat
  class MessageParser

    getter message, command
    def initialize(message : String)
      @message = message
    end

    def command_from_message : Commands::BaseCommand
      split = @message.split
      commands = CommandList.new.list
      default = commands.values.find { |c| c.command == "default" } as Commands::BaseCommand
      return default unless split.size > 1
      command = split[1].downcase
      begin
        commands[command] || default
      rescue
        default
      end
    end
  end
end
