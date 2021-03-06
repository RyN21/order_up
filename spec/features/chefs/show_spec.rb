require 'rails_helper'

RSpec.describe "Chef's Show Page" do
  before :each do
    @chef = Chef.create!(name: "Frank")
    @pizza = @chef.dishes.create!(name: "Pizza", description: "Thick crust and extra cheesy")
    @bread_sticks = @chef.dishes.create!(name: "Bread Sticks", description: "Tasty seasoned bread sticks")
    @calzone = @chef.dishes.create!(name: "Bread Sticks", description: "Tasty seasoned bread sticks")
    @cheezy_bread = @chef.dishes.create!(name: "Bread Sticks", description: "Tasty seasoned bread sticks")
    @bread = Ingredient.create!(name: "Bread", calories: 200)
    @cheese = Ingredient.create!(name: "Cheese", calories: 400)
    @sause = Ingredient.create!(name: "Marinara Sause", calories: 150)
    DishIngredient.create!(dish: @pizza, ingredient: @bread)
    DishIngredient.create!(dish: @pizza, ingredient: @cheese)
    DishIngredient.create!(dish: @pizza, ingredient: @sause)
    DishIngredient.create!(dish: @calzone, ingredient: @bread)
    DishIngredient.create!(dish: @calzone, ingredient: @cheese)
    DishIngredient.create!(dish: @calzone, ingredient: @sause)
    DishIngredient.create!(dish: @cheezy_bread, ingredient: @bread)
    DishIngredient.create!(dish: @cheezy_bread, ingredient: @cheese)
    DishIngredient.create!(dish: @bread_sticks, ingredient: @bread)
  end

  it "displys chefs name" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content("Frank")
  end

  it "displays link to view all ingredients the chef uses in their dishes" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_link("See chef's ingredients list")
  end

  describe "when I click on that link, I am taken to the chef's ingredients index page" do
    it "displays a UNIQUE list of names of all the ingredients the chef uses" do
      visit "/chefs/#{@chef.id}"

      click_on "See chef's ingredients list"

      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@bread.name)
      expect(page).to have_content(@sause.name)
    end
  end
  # 
  # it "displays the chef's 3 most used ingredients" do
  #   visit "/chefs/#{@chef.id}"
  #
  #   expect(page).to have_content("1. Bread")
  #   expect(page).to have_content("2. Cheese")
  #   expect(page).to have_content("3. Marinara Sause")
  # end
end

# Extension
# As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)
# Collapse
