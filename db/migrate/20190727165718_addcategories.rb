class Addcategories < ActiveRecord::Migration[5.2]
  def up
    categories = ["Fashion", "Beauty", "Home","Electronics","Books"]
    categories.each do |category|
      Category.create(name:category)
    end
  end

  def down
    Category.delete_all
  end
end
