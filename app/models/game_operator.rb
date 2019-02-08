class GameOperator < ApplicationRecord
  belongs_to :operator
  belongs_to :game
end
