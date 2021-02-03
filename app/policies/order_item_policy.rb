class OrderItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #current_order.order_items
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end
end
