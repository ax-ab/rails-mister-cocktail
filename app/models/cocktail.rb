class Cocktail < ApplicationRecord
  # When you delete a cocktail, you should delete associated doses (but not the ingredients as they can be linked to other cocktails).
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # A cocktail must have a unique name.
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :image_url, presence: true
end
