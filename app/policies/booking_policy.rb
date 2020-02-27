class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user != user
  end

  def index?
    return true
  end

  def new?
    create?
  end

  def show?
    return true
  end
end
