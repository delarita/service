class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       if user.admin == true
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    true
  end

  def destroy?
    record.user == user || user.admin == true
  end
end
