class FoodsController < ApplicationController 
  def index 
    @query = params[:q]
    @foods = FoodFacade.search_foods(@query)
    @total_hits = FoodFacade.total_hits(@query)
  end
end