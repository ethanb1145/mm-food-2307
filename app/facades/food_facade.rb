class FoodFacade

  def self.search_foods(query)
    service = FoodsService.new
    response = service.food_search(query)

    response[:foods].map do |food_data|
      Food.new(food_data)
    end
  end

  def self.total_hits(query)
    service = FoodsService.new
    service.total_hits(query)
  end
end