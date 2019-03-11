class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private 
    def remove_points
      self.author.subtract_points(1, category: self.class.name.downcase)
    end
end
