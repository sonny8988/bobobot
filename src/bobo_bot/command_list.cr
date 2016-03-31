module BoboBot
  # Parses the command from hipchat
  class CommandList

    def initialize
      default = Commands::Default.new # First
      lunch = Commands::Lunch.new
      @hash = {
        lunch.command => lunch,
        default.command => default
      }
    end

    def list : Hash
      @hash
    end
  end
end
