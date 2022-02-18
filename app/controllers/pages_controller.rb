class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
    # Collections
    @group_shows = ["groupshow", "group show", "exhibition", "exhibit"]
    @trending_topics = ["gender", "identity", "video art", "video", "masculinity", "virtual", "immersive", "immersion"]
    @joint_works = ["jointworks", "joint works"]
    @paid_roles = ["low", "medium", "high"]
    @collection_titles = ["Group Shows", "Trending Topics", "Joint Works", "Paid Roles"]
    @collections = [@group_shows, @trending_topics, @joint_works, @paid_roles, @collection_titles]
  end

  def dashboard
    @user = current_user
    set_user_data
  end

  def profile
    @user = User.find(params[:id])
    set_user_data
  end

  def results
    @users = []
    @projects = []

    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])

      @results.each do |result|
        if result.searchable_type == "Project"
          @projects.push(Project.find(result.searchable.id))
        else
          @users.push(result.searchable)
        end
      end
    else
      @results = []
    end
  end

  private

  def set_my_collabs
    @pending_collabs = []
    @collaborations = Collaboration.where(user: @user)
    @collaborations_to_my_projects = Collaboration.where(project_id: @projects)
    @my_collabs_accepted = Collaboration.where(user: @user, confirmed: true)
    @my_collabs_pending = @collaborations - @my_collabs_accepted
    @collaborations_to_my_projects.each do |collab|
      if collab.status == nil
        @pending_collabs << collab
      end
    end
  end

  def set_projects
    @projects = Project.where(user: current_user)
  end

  def set_favorites
    @favorites = Favorite.where(user: @user)
    @project_faves = @favorites.map { |fave| Project.find(fave.project_id) }
  end

  def set_user_data
    set_projects
    set_my_collabs
    set_favorites
  end
end
