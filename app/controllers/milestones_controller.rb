class MilestonesController < ApplicationController

  before_action :set_milestone, only %i[ show edit update destroy ]
  
  def show
    @milestones = policy_scope(Milestone).order(created_at: :desc)
  end

  def create
    @milestone = Milestone.new(milestone_params)
    @project = Project.find(params[:project_id])
    @milestone.project = @project
    authorize @milestone
    @project.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:title, :description, :compled, :project_id)
  end
end
