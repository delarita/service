class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #scope.where(order: current_order)
    end
  end


end
