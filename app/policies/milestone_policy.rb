class MilestonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # ASSING POLICIES FOR PROJECT SHOW PAGE SO THAT ONLY TEAM MEMBERS CAN SEE MILESTONES

  def create?
    # record.project.user == user ( the owner can create ) for other ones
  end

  def new?
    create?
  end

  def update?
    record.user == user || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user || user.admin?
  end
end
