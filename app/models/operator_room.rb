class OperatorRoom < ApplicationRecord
  belongs_to :operator
  belongs_to :objective, optional: true
  belongs_to :room
end
