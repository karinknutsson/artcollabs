class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # ASSING POLICIES FOR PROJECTS SO THAT ONLY TEAM MEMBERS CAN SEE ADDITIONAL INFO


  def index?
    record.user == user || user.admin?
  end

  def show?
    record.user == user || user.admin?
  end

  def create?
    true
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
