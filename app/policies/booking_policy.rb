class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    record.user != user
    return true
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

  def update?
    record.user == user
    return true
  end

  def destroy?
    record.user == user
    return true
  end
end
