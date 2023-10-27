class Food 
  attr_reader :id, :description, :brand, :ingredients
  
  def initialize(data)
    @id = data[:gtinUpc]
    @description = data[:description]
    @brand = data[:brandOwner]
    @ingredients = data[:ingredients]
    @total_hits = data[:totalHits]
  end
end