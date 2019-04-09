class Character < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :ingredients, as: :piece
end
