class Objective < ApplicationRecord
  ACTION_OPTIONS = %w[Attack Defend Capture].freeze

  validates_inclusion_of :action, in: ACTION_OPTIONS

  belongs_to :strategy
  belongs_to :target,
             class_name: 'Location',
             optional: true
  belongs_to :master,
             class_name: 'Objective',
             foreign_key: 'master_id',
             optional: true
  belongs_to :next,
             class_name: 'Objective',
             foreign_key: 'next_id',
             optional: true
  has_many :previous,
           class_name: 'Objective',
           foreign_key: 'next_id', dependent: :nullify
  has_many :recipes, dependent: :nullify
  has_many :slaves,
           class_name: 'Objective',
           foreign_key: 'master_id', dependent: :nullify
  has_many :primaries,
           class_name: 'OperatorStrategy',
           foreign_key: 'primary_id',
           dependent: :nullify
  has_many :secondaries,
           class_name: 'OperatorStrategy',
           foreign_key: 'secondary_id',
           dependent: :nullify
  has_many :tertiaries,
           class_name: 'OperatorStrategy',
           foreign_key: 'tertiary_id',
           dependent: :nullify
  has_many :defaults,
           class_name: 'OperatorStrategy',
           foreign_key: 'default_id',
           dependent: :nullify
  has_many :operator_strategies, dependent: :nullify
  has_many :current_ops,
           class_name: 'Operator',
           foreign_key: 'current_objective_id'
  after_commit { UpdateAssignmentFlowJob.perform_later(strategy) }
end
