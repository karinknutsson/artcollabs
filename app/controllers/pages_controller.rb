class PagesController < ApplicationController
  before_action :set_user_projects_and_collabs, only: %i[ profile dashboard ]
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
    # add collections arrays from Projects?
  end

  # ⭕ I think some policies must be set 
  def dashboard
    #authorize @projects
  
  end

  # ⭕ I think some policies must be set 
  def profile 
    #authorize @projects
  end
  
  private

  def set_user_projects_and_collabs

    @user = User.find(params[:id])
    @projects = Project.where(user: @user)

    # My collabs on other's projects
    @collaborations = Collaboration.where(user: @user)

    ## Collabs for my projects
    @collaborations_to_my_projects = Collaboration.joins(:projects).where(user: current_user).where(confirmed: nil)

  end

end
