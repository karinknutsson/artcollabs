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
    respond_to do |format|
      if @milestone.save
        format.html { redirect_to @milestone, notice: "milestone was successfully created." }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milestonee.errors, status: :unprocessable_entity }
      end
    end
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
