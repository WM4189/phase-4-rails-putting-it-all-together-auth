class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  # validates :instructions, numericality: {greater_than_or_equal_to: 50}
  validates :instructions,  presence: true, length: { minimum: 50 }
end
