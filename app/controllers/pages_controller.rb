class PagesController < ApplicationController
  before_action :set_user_projects, only: %i[ :profile, :dashboard ]
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
    # add collections arrays from Projects?
  end

  def dashboard
    authorize @projects
    # authorize @collaborations
    # authorize @collaborations_to_my_projects
  end

  def profile
    authorize @projects
    # authorize @collaborations
    # authorize @collaborations_to_my_projects
  end
  
  private

  def set_user_projects_and_collabs
    @user = current_user
    @projects = @user.projects

    # My collabs on other's projects
    @collaborations = @user.collaborations

    ## Collabs for my projects
    @collaborations_to_my_projects = Collaboration.joins(:projects).where(user: current_user).where(confirmed: nil)
  end

end
