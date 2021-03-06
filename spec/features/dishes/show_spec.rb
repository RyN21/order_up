require 'rails_helper'

RSpec.describe "Dish's Show Page" do
  before :each do
    @chef = Chef.create!(name: "Frank")
    @pizza = @chef.dishes.create!(name: "Pizza", description: "Thick crust and extra cheesy")
    @bread = Ingredient.create!(name: "Bread", calories: 200)
    @cheese = Ingredient.create!(name: "Cheese", calories: 400)
    @sause = Ingredient.create!(name: "Marinara Sauase", calories: 150)
    DishIngredient.create!(dish: @pizza, ingredient: @bread)
    DishIngredient.create!(dish: @pizza, ingredient: @cheese)
    DishIngredient.create!(dish: @pizza, ingredient: @sause)
  end

  it "on a dish's show page, it displays a list of ingredients for that dish and the chefs name" do


    visit "/dishes/#{@pizza.id}"

    expect(page).to have_content(@bread.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@sause.name)
    expect(page).to have_content("Frank")
  end

  it "shows the total calorie count for that dish" do
      visit "/dishes/#{@pizza.id}"

      expect(@pizza.calorie_count).to eq(750)
      expect(page).to have_content("Total calorie count: 750")
  end
end
