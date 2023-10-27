class FoodsService
  def conn 
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.food[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def food_search(query)
    get_url("/fdc/v1/foods/search?query=#{query}")
  end

  def total_hits(query)
    response = food_search(query)
    response[:totalHits]
  end
end