class EventPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(target: user.projects)
    end
  end

  def index?
    user.present?
  end
end
