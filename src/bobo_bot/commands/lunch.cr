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


      def respond_to(full_message)
        option = begin
                   full_message.gsub("\"", "").split[2]
                 rescue
                   ""
                 end
        load_ankit_meals  if option.downcase == "ankit"
        load_vegi_meals   if option.downcase == "vegi"
        load_best_meals   if option.downcase == "best"

        json
      end

      private def load_regular_meals
        @Flr9 = @lunch_response.data.select { |d| d.cafeteriaId == "9F" && d.mealTime == 1 }
        @Flr22 = @lunch_response.data.select { |d| d.cafeteriaId == "22F" && d.mealTime == 1 }
      end

      private def load_ankit_meals
        @Flr9 = @lunch_response.data.select do |d|
          d.cafeteriaId == "9F" &&
          !d.ingredients.beef &&
          !d.ingredients.fish &&
          !d.ingredients.mutton &&
          !d.ingredients.pork &&
          d.ingredients.chicken
        end
        @Flr22 = @lunch_response.data.select do |d|
          d.cafeteriaId == "22F" &&
          !d.ingredients.beef &&
          !d.ingredients.fish &&
          !d.ingredients.mutton &&
          !d.ingredients.pork &&
          d.ingredients.chicken
        end
      end

      private def load_vegi_meals
        @Flr9 = @lunch_response.data.select do |d|
          d.cafeteriaId == "9F" &&
          !d.ingredients.beef &&
          !d.ingredients.fish &&
          !d.ingredients.mutton &&
          !d.ingredients.pork &&
          !d.ingredients.chicken
        end
        @Flr22 = @lunch_response.data.select do |d|
          d.cafeteriaId == "22F" &&
          !d.ingredients.beef &&
          !d.ingredients.fish &&
          !d.ingredients.mutton &&
          !d.ingredients.pork &&
          !d.ingredients.chicken
        end
      end

      private def load_best_meals
        @Flr9 = @lunch_response.data.select { |d| d.cafeteriaId == "9F" && d.mealTime == 1 && d.umaiCount > 0 }
        @Flr22 = @lunch_response.data.select { |d| d.cafeteriaId == "22F" && d.mealTime == 1 && d.umaiCount > 0 }
      end
    end
  end
end
