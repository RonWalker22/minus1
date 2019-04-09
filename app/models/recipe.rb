class Recipe < ApplicationRecord
  belongs_to :commander, class_name: 'User'
  belongs_to :objective, optional: true
  has_many :directions, dependent: :delete_all
  has_many :ingredients, dependent: :delete_all
  has_many :user_recipes, dependent: :delete_all
  has_many :users, through: :user_recipes
end
