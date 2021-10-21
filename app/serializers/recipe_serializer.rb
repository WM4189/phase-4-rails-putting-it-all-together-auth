class RecipeSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :title, :instructions, :minutes_to_complete

end
