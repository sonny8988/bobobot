require "json"
require "http/client"

module LunchApi
  extend self

  def get_data(date : String)
    res = HTTP::Client.get("http://rakuten-towerman.azurewebsites.net/towerman-restapi/rest/cafeteria/menulist?menuDate=#{date}")
    body = res.body
    Poop::Response.from_json body
  end

end

module Poop
  class Response
    JSON.mapping({
      correlationId: String,
      data: Array(Data)
    })
  end

  class Data
    JSON.mapping({
      cafeteriaId: String,
      imageURL: String,
      title: String,
      mealTime: Int32,
      calories: Int32,
      umaiCount: Int32,
      ingredients: Ingredients
    })
  end

  class Ingredients
    JSON.mapping({
      alcohol: Bool,
      beef: Bool,
      chicken: Bool,
      fish: Bool,
      mutton: Bool,
      pork: Bool,
      healthy: Bool
    })
  end
end
