require 'rails_helper'

RSpec.describe "Dish's Show Page" do
  it "on a dish's show page, it displays a list of ingredients for that dish and the chefs name" do
    chef = Chef.create!(name: "Frank")
    pizza = chef.dishes.create!(name: "Pizza", description: "Thick crust and extra cheesy")
    bread = Ingredient.create!(name: "Bread", calories: 200)
    cheese = Ingredient.create!(name: "Cheese", calories: 400)
    sause = Ingredient.create!(name: "Marinara Sauase", calories: 150)

    DishIngredients.create!(dish: pizza, ingredient: bread)
    DishIngredients.create!(dish: pizza, ingredient: cheese)
    DishIngredients.create!(dish: pizza, ingredient: sause)

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(bread.name)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(sause.name)
    expect(page).to have_content("Frank")
  end
end
