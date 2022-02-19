class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
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

      @projects.push(*policy_scope(Project.tagged_with(params[:query])))
      @users.push(*policy_scope(User).tagged_with(params[:query]))
    else
      @results = []
    end
  end

  private

  def set_my_collabs
    @pending_collabs = []
    @collabs = Collab.where(user: @user)
    @collabs_to_my_projects = Collab.where(project_id: @projects)
    @my_collabs_accepted = Collab.where(user: @user, confirmed: true)
    @my_collabs_pending = @collabs - @my_collabs_accepted
    @collabs_to_my_projects.each do |collab|
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
