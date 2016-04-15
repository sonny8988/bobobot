module BoboBot
  # Parses the command from hipchat
  class CommandList

	def initialize
	  default = Commands::Default.new # First
	  lunch = Commands::Lunch.new
	  bestlunch = Commands::BestLunch.new
	  ankitlunch = Commands::AnkitLunch.new
	  vegilunch = Commands::VegiLunch.new
	  dinner = Commands::Dinner.new
	  slap = Commands::Slap.new
	  @hash = {
		lunch.command =>		lunch,
		bestlunch.command =>	bestlunch,
		ankitlunch.command =>   ankitlunch,
		vegilunch.command =>	vegilunch,
		dinner.command =>	    dinner,
		slap.command =>		    slap,
		default.command =>	    default
	  }
	end

	def list : Hash
	  @hash
	end
  end
end
