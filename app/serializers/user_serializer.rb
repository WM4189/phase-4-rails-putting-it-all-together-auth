class UserSerializer < ActiveModel::Serializer
  # has_many :recipes
  attributes :id, :username, :image_url, :bio

end
