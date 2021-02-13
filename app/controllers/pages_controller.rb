class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
    # add collections arrays from Projects?
  end

  def dashboard
    @user = current_user
  end

  def profile
    @user = current_user
  end

end
