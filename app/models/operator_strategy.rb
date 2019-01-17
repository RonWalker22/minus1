class OperatorStrategy < ApplicationRecord
  belongs_to :operator
  belongs_to :strategy
  belongs_to :primary,
             class_name: 'Objective',
             foreign_key: 'primary_id',
             optional: true
  belongs_to :secondary,
             class_name: 'Objective',
             foreign_key: 'secondary_id',
             optional: true
  belongs_to :tertiary,
             class_name: 'Objective',
             foreign_key: 'tertiary_id',
             optional: true
  belongs_to :default,
             class_name: 'Objective',
             foreign_key: 'default_id',
             optional: true
end
