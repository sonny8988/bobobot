module BoboBot
  # Parses the command from hipchat
  class CommandList

    def initialize
      default = Commands::Default.new # First
      lunch = Commands::Lunch.new
      dinner = Commands::Dinner.new
      @hash = {
        lunch.command => lunch,
        dinner.command => dinner,
        default.command => default
      }
    end

    def list : Hash
      @hash
    end
  end
end
