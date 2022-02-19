class PagesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end

  def dashboard?
    record.user == user
  end

  def profile?
    true
  end
end
