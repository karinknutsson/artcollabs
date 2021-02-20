class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
    # add collections arrays from Projects by tags?
  end

  def dashboard
    @user = current_user

    # My projects (which I created)
    @projects = Project.where(user: @user)

    # My collabs on other's projects
    @collaborations = Collaboration.where(user: @user)

    # pending Collabs for my projects
    @collaborations_to_my_projects = Collaboration.joins(:project).where(user: current_user)

    ## FOR THE DASHBOARD TABS
    @open_projects = []
    @active_projects = []
    @closed_projects = []
    @finished_projects = []
    ###########################

    @projects.each do |project|
      if project.status == "open"
        @open_projects << project
      elsif project.status == "active"
        @active_projects << project
      elsif project.status == "closed"
        @closed_projects << project
      elsif project.status == "finished"
        @finished_projects << project
      end
    end
  end

  def profile 
    @user = User.find(params[:id])

    # My projects and collabs
    @projects = Project.where(user: @user)
    @collaborations = Collaboration.where(user: @user)
  end
  
  private

end
