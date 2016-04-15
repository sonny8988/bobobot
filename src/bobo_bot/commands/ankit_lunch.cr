require "ecr/macros"
module BoboBot
  # Lunch  Response
  module Commands
    class AnkitLunch < BaseCommand
      def initialize
        @command = "ankit lunch"
        time = (Time.utc_now + 9.hours).to_s("%Y%m%d") # Tokyo time
        @lunch_response = ::LunchApi.get_data(time)
        @Flr9 = @lunch_response.data.select do |d|
            d.cafeteriaId == "9F" &&
            !d.ingredients.beef &&
            !d.ingredients.fish &&
            !d.ingredients.mutton &&
            !d.ingredients.pork &&
            d.ingredients.chicken &&
        end
        @Flr22 = @lunch_response.data.select do |d|
            d.cafeteriaId == "22F" &&
            !d.ingredients.beef &&
            !d.ingredients.fish &&
            !d.ingredients.mutton &&
            !d.ingredients.pork &&
            d.ingredients.chicken &&
        end
      end

      def json
        {
          color: "blue",
          message: "<h2>meal with chicken are:</h2> #{html}",
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
