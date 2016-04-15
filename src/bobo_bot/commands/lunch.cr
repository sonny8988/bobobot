require "ecr/macros"
module BoboBot
  # Lunch  Response
  module Commands
    class Lunch < BaseCommand
      def initialize
        @command = "lunch"
        time = (Time.utc_now + 9.hours).to_s("%Y%m%d") # Tokyo time
        @lunch_response = ::LunchApi.get_data(time)
        @Flr9 = @lunch_response.data.select { |d| d.cafeteriaId == "9F" && d.mealTime == 1 }
        @Flr22 = @lunch_response.data.select { |d| d.cafeteriaId == "22F" && d.mealTime == 1 }
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
