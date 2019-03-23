class Recipe < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  belongs_to :objective, optional: true
  has_many :directions, dependent: :delete_all
  has_many :ingredients, dependent: :delete_all
  has_many :operator_recipes, dependent: :delete_all
  has_many :operators, through: :operator_recipes
end
