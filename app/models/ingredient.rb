class Ingredient < ApplicationRecord
  has_many :doses

  # You can’t delete an ingredient if it used by at least one cocktail.
  has_many :cocktails, through: :doses

  # An ingredient must have a unique name.
  validates :name, uniqueness: true
  validates :name, presence: true
end
