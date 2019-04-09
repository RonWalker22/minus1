class Loadout < ApplicationRecord
  KIND_OPTIONS = %w[Primary Secondary Sight Grip Attachment Utility]

  validates_inclusion_of :kind, in: KIND_OPTIONS

  belongs_to :game
  belongs_to :user
  has_many :ingredients, as: :piece
end
