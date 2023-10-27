require "rails_helper"

RSpec.describe FoodsService do
  describe "class methods" do
    describe "foods" do
      it "all foods are shown with their data", :vcr do
        json_data = File.read("spec/fixtures/sweet_potatoes.json")
        stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{Rails.application.credentials.food[:api_key]}&query=sweet potatoes").
        to_return(status: 200, body: json_data, headers: {})
        VCR.insert_cassette("sweet_potatoes")

        search = FoodsService.new.food_search("sweet potatoes")
        expect(search).to be_a Hash
        food_data = search[:foods]

        expect(food_data.first).to have_key(:description)
        expect(food_data.first).to have_key(:gtinUpc)
        expect(food_data.first).to have_key(:brandOwner)
        expect(food_data.first).to have_key(:ingredients)
      end
    end
  end
end