class RemoveForeignKeyFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :recipe_id
  end
end
