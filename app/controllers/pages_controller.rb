class PagesController < ApplicationController
  before_action :get_my_collabs, only: [ :dashboard, :show ]
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)

    # Collections
    @group_shows = Project.where(tag_list: ["group-show", "groupshow", "exhibition", "exhibit"])
    @trending_topics = Project.where(tag_list: ["gender", "identity", "vidoe-art", "masculinity"])
    @joint_works = Project.where(tag_list: ["jointworks", "joint-works"])
    @paid_roles = Project.where(budget: ["low", "medium", "high"])
    @collection_titles = ["Group Shows", "Trending Topics", "Joint Works", "Paid Roles"]
    @collections = [@group_shows, @trending_topics, @joint_works, @paid_roles, @collection_titles]
  end

  def dashboard
    @user = current_user

    # My projects (which I created)
    @projects = Project.where(user: @user)

    # My collabs on other's projects
    @collaborations = Collaboration.where(user: @user)
    @my_collabs_accepted = Collaboration.where(user: @user, confirmed: true)
    @my_collabs_pending = @collaborations - @my_collabs_accepted

    # Favorites
    @favorites = FavouriteProject.where(user: @user)
    @project_faves = @favorites.map { |fave| Project.find(fave.project_id) }

    ## FOR THE DASHBOARD TABS
    # @open_projects = []
    # @active_projects = []
    # @closed_projects = []
    # @finished_projects = []
    # @projects.each do |project|
    #   if project.status == "open"
    #     @open_projects << project
    #   elsif project.status == "active"
    #     @active_projects << project
    #   elsif project.status == "closed"
    #     @closed_projects << project
    #   elsif project.status == "finished"
    #     @finished_projects << project
    #   end
    # end
    ###########################
  end

  def show
  end

  def profile
    @user = User.find(params[:id])

    # My projects and collabs
    @projects = Project.where(user: @user)
    @collaborations = Collaboration.where(user: @user)
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
