class MilestonesController < ApplicationController

  before_action :set_milestone, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[ create edit destroy ]
  
  #✅
  def show
    #@milestones = policy_scope(Milestone).order(created_at: :desc)
    @milestones = Milestone.where(project_id: @project)
  end
  
  def new
    @milestone = Milestone.new
  end

  def create
    # NOT TESTED AT ALL
    @milestone = Milestone.new(milestone_params)
    # @project = Project.find(params[:project_id])
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
    # @project = Project.find(params[:project_id])
    authorize @milestone
  end

  def update
    authorize @milestone
    if @milestone.update(milestone_params)
      redirect_to project_path(@milestone.project)
      flash[:notice] = " Milestone was edited"
    else
      render :edit
    end
  end

  def destroy
    # @project = Project.find(params[:project_id])
    @milestone.destroy
    authorize @milestone
    redirect_to @project
  end

  private
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:title, :description, :completed, :project_id)
  end
end
