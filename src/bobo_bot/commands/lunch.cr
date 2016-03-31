require "ecr/macros"
module BoboBot
  # Lunch  Response
  module Commands
    class Lunch < BaseCommand
      def initialize
        @command = "lunch"
        @lunch_response = ::LunchApi.get_data(Time.now.to_s("%Y%m%d"))
        @Flr9 = @lunch_response.data.select { |d| d.cafeteriaId == "9F" }
        @Flr22 = @lunch_response.data.select { |d| d.cafeteriaId == "22F" }
      end

      def json
        {
          color: "blue",
          message: html,
          notify: false,
          message_format: "html"
        }.to_json
      end

      def html
        io = MemoryIO.new
        ECR.embed "src/bobo_bot/commands/lunch.ecr", io
        io.to_s
      end
    end
  end
end
