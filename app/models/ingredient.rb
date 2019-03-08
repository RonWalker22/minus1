class Ingredient < ApplicationRecord
  KIND_OPTIONS = %w[Loadout Character Respawn].freeze

  validates_inclusion_of :kind, in: KIND_OPTIONS

  belongs_to :recipe
end
