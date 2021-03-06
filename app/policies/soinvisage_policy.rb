class SoinvisagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
  end

  def create?
    user.nil? ? false : user.admin?
  end

  def show?
    true
  end

  def update?
    user.nil? ? false : user.admin?
  end

  def destroy?
    user.nil? ? false : user.admin?
  end
end
