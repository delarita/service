class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    puts 'payments policy'
    true
  end


end
