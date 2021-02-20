class FavouriteProjectsController < ApplicationController
  before_action :set_project, only: %i[ create destroy ]
  before_action :set_user , only: %i[ create destroy ]

  # ⭕
  def create
    # gets latest page user was visiting
    session[:return_to] ||= request.referer
    
    @favourite_project = FavouriteProject.new(favourite_projects_params)
    @favourite_project.user = User.find(params[:favourite_project][:user])
    @favourite_project.project = @project
    authorize @favourite_project
    @favourite_project.save

    # redirects to latest page user was visiting
    redirect_to session.delete(:return_to)
  end

  def destroy
    @favourite_project.destroy
  end

  
  private
  
  def set_user
    @user = current_user
  end

  def favourite_projects_params
    params.require(:favourite_project).permit(:user_id, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
