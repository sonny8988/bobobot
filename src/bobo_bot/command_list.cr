module BoboBot
  # Parses the command from hipchat
  class CommandList

    def initialize
      default = Commands::Default.new
      lunch = Commands::Lunch.new
      dinner = Commands::Dinner.new
      slap = Commands::Slap.new
      @hash = {
        lunch.command =>        lunch,
        "runch" =>              lunch,
        dinner.command =>       dinner,
        slap.command =>         slap,
        default.command =>      default
      }
    end

    def list : Hash
      @hash
    end
  end
end
