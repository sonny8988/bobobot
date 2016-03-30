module BoboBot
  # Unknown Response
  class UnknownResponse
    def initialize(message : String)
      @message = message
    end

    def json
      {
        color: "gray",
        message: "I'm a Bobo",
        notify: false,
        message_format: "text"
      }.to_json
    end
  end
end
