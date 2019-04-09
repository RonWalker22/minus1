class UserTeam < ApplicationRecord
  TITLE_OPTIONS = ['Operator', 'Lead Operator', 'Commander'].freeze
  
  validates_inclusion_of :title, in: TITLE_OPTIONS
  belongs_to :team
  belongs_to :user
end
