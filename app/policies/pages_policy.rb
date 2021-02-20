class PagesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end
  
  # ⭕ only user should be able to access their dashboard
  def dashboard?
    true
  end

  def profile?
    true
  end

end
