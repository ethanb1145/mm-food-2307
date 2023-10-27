require "rails_helper"

RSpec.describe "FoodFacade" do 
  it "should call the facade and retrieve search results", :vcr do 
    query = "sweet potatoes"

    results = FoodFacade.search_foods(query)

    expect(results).to be_an(Array)

    food = results.first
    
    expect(food).to be_a(Food)
    expect(food.upc).to eq("8901020020844")
    expect(food.brand).to eq("NOT A BRANDED ITEM")
    expect(food.description).to eq("SWEET POTATOES")
    expect(food.ingredients).to eq("ORGANIC SWEET POTATOES.")
  end
end