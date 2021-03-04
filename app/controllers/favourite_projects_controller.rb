class FavouriteProjectsController < ApplicationController
  before_action :set_project, only: %i[ create destroy ]
  before_action :set_user , only: %i[ create destroy ]

  # ⭕
  def create
    # gets latest page user was visiting
    session[:return_to] ||= request.referer

    @favourite_project = FavouriteProject.new(user: current_user, project: @project)
    authorize @favourite_project
    @favourite_project.save

    # redirects to latest page user was visiting
    redirect_to session.delete(:return_to)
  end

  def destroy
    favourite_project = FavouriteProject.find(params[:id])
    authorize favourite_project
    favourite_project.destroy
    redirect_to project_path(@project)
  end

  private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
