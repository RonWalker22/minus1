class UserStrategy < ApplicationRecord
  belongs_to :user
  belongs_to :strategy
  belongs_to :objective
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
  after_update_commit :check_objective_change

  private

    def check_objective_change
      if previous_changes.key?(:objective_id)
        RoomsBroadcastJob.perform_later self.user.room
        clear_changes_information
      end
    end
end
