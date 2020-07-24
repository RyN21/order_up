class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    ingredients = []
    dishes.each do |dish|
      ingredients << dish.ingredients
    end
    ingredients.flatten.uniq
  end
end
