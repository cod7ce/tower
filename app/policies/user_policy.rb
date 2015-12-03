class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.includes(:projects).where(projects: {id: user.projects})
    end
  end
end
