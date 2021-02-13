class MilestonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # ASSING POLICIES FOR PROJECT SHOW PAGE SO THAT ONLY TEAM MEMBERS CAN SEE MILESTONES
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
