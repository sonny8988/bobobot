module BoboBot
  module Commands
    class BaseCommand
      getter command
      @command : String
      def initialize
        @command = ""
      end

      # response for message
      def respond_to(full_message)
        json
      end

      protected def json
        {
          color: "gray",
          message: "I'm a BoboBot, therefore I don't understand your command.",
          notify: false,
          message_format: "text"
        }.to_json
      end
    end
  end
end
