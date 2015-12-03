class TeamPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.includes(:members).where(users: {id: user.id})
    end
  end
end
