class MilestonesController < ApplicationController

  before_action :set_milestone, only %i[ show edit update destroy ]
  
  #❌
  def show
    #@milestones = policy_scope(Milestone).order(created_at: :desc)
    @milestones = Milestone.where(project_id: @project)
  end

  def create
    # NOT TESTED AT ALL
    @milestone = Milestone.new(milestone_params)
    @project = Project.find(params[:project_id])
    @milestone.project = @project
    authorize @milestone
    if @milestone.save
      redirect_to @project
      flash[:notice] = "Milestone added"
    else
      render :new
    end
  end

  def edit
    authorize @milestone
  end

  def update
    authorize @milestone
  end

  def destroy
    authorize @milestone
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:title, :description, :completed, :project_id)
  end
end
