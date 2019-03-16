class Ingredient < ApplicationRecord
  KIND_OPTIONS = %w[Loadout Character Respawn].freeze
  
  belongs_to :piece, polymorphic: true
  belongs_to :recipe
  belongs_to :parent,
             class_name: 'Ingredient',
             foreign_key: 'parent_id',
             optional: true
  has_many :children,
           class_name: 'Ingredient',
           foreign_key: 'parent_id', dependent: :nullify
end