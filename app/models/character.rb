class Character < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'Operator', foreign_key: 'operator_id'
end
