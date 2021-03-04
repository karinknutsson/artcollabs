class PagesController < ApplicationController
  before_action :get_my_collabs, only: [ :dashboard ]
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
    # add collections arrays from Projects by tags?
    @quote = footer_quotes.sample
  end

  def dashboard
    @user = current_user

    # My projects (which I created)
    @projects = Project.where(user: @user)

    # My collabs on other's projects
    @collaborations = Collaboration.where(user: @user)

    # ❌ pending Collabs for my projects
    # get_my_collabs

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

  def footer_quotes
    @quotes = [
      "Life isn't about finding yourself. Life is about creating yourself.",
      "You see things; and you say 'Why?' But I dream things that never were; and I say 'Why not?'",
      "Progress is impossible without change, and those who cannot change their minds cannot change anything.",
      "A life spent making mistakes is not only more honorable, but more useful than a life spent doing nothing.",
      "You use a glass mirror to see your face; you use works of art to see your soul.",
      "Without art, the crudeness of reality would make the world unbearable.",
      "If you hear a voice within you say 'you cannot paint,' then by all means paint, and that voice will be silenced."
    ]
  end

  private

  def get_my_collabs
    @pending_collabs = []

    @projects = Project.where(user: current_user)

    @collaborations_to_my_projects = Collaboration.where(project_id: @projects)

    @collaborations_to_my_projects.each do |collab|
      if collab.status == nil
        @pending_collabs << collab
      end
    end
  end
end
