module BoboBot
  # Lunch  Response
  class LunchResponse
    def initialize(message : String)
      @message = message
    end

    def json
      {
        color: "blue",
        message: "I'm a Lunch",
        notify: false,
        message_format: "text"
      }.to_json
    end
  end
end
