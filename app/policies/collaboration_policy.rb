class CollaborationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    true
    record.user == user || user.admin?
  end

  def show?
    true
    #record.user == user || user.admin?
  end

  def create?
    true
    
  end

  def new?
    create?
  end

  def update?
    true
    record.user == user || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    true
    record.user == user || user.admin?
  end
end
