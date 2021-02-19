class FavouriteProjectsController < ApplicationController
  before_action :set_project, only: %i[ create destroy ]
  before_action :set_user , only: %i[ create destroy ]

  def new
    @favourite_project = FavouriteProject.new
  end

  def create
    @favourite_project = FavouriteProject.new( user: @user, project: @project )
  end

  def destroy
    @favourite_project.destroy
  end

  def set_user
    @user = current_user
  end

  def set_project
    # This would work on show, but how to get the projects ID in the index for example?
    @project = Project.find(params[:project_id])
  end
end
