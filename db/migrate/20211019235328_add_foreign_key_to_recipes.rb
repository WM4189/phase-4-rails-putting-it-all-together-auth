class AddForeignKeyToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :user, :belongs_to
  end
end
