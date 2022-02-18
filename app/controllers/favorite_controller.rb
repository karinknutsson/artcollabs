class FavoritesController < ApplicationController
  before_action :set_project, only: %i[ create destroy ]
  before_action :set_user , only: %i[ create destroy ]
  before_action :set_previous_page , only: %i[ create destroy ]

  def create
    @favorite = Favorite.new(user: current_user, project: @project)
    authorize @favorite
    @favorite.save
    redirect_to session.delete(:return_to)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    authorize favorite
    favorite.destroy
    redirect_to project_path(@project)
  end

  private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_previous_page
    session[:return_to] ||= request.referer
  end
end
