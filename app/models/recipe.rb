class Recipe < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  belongs_to :objective
  has_many :ingredients
  has_many :operator_recipes
  has_many :operators, through: :operator_recipes
end
