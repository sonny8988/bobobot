require "ecr/macros"
module BoboBot
  # Lunch  Response
  module Commands
    class Slap < BaseCommand
      def initialize
        @command = "slap"
      end

      def json
        {
          color: "blue",
          message: "<img src='http://stream1.gifsoup.com/view3/1766870/how-can-she-slap-o.gif'></img>",
          notify: false,
          message_format: "html"
        }.to_json
      end
    end
  end
end
