class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def show?
    true
  end

  def index?
    record.status == 'supported'
  end
end
