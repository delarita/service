class OrderItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #p scope.all
      #p @user
      #current_order.order_items
      #puts "here---------------------------"
      #p scope.where(order: current_order)
      #puts "here---------------------------"
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
