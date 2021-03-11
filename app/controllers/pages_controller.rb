class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

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
    set_user_data
  end

  def profile
    @user = User.find(params[:id])
    set_user_data
  end

  private

  def set_my_collabs
    @pending_collabs = []
    @collaborations = Collaboration.where(user: @user)
    @my_collabs_accepted = Collaboration.where(user: @user, confirmed: true)
    @my_collabs_pending = @collaborations - @my_collabs_accepted
    @collaborations.each do |collab|
      @pending_collabs << collab if collab.status.nil?
    end
  end

  def set_projects
    @projects = Project.where(user: @user)
  end

  def set_favourites
    @favorites = FavouriteProject.where(user: @user)
    @project_faves = @favorites.map { |fave| Project.find(fave.project_id) }
  end

  def set_user_data
    set_projects
    set_my_collabs
    set_favourites
  end
end
