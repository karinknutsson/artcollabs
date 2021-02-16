class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  
  def new
    @collaboration = Collaboration.new(params[:project_id])
    authorize @collaboration
  end

  def create 
    # ❌
    @collaboration = Collaboration.new(collaboration_params)
    # How to get project ID?
    # @project = Project.find(params[:project_id])
    @collaboration.project = @project
    authorize @collaboration
    respond_to do |format|
      if @collaboration.save
        format.html { redirect_to @collaboration, notice: "collaboration was successfully created." }
        format.json { render :show, status: :created, location: @collaboration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collaboratione.errors, status: :unprocessable_entity }
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

  def set_collaboration
    @collaboration = @collaboration.find(params[:id])
    authorize @collaboration
  end
  
  def collaboration_params
    params.require(:collaboration).permit(:project_id, :user_id, :status, :role)
  end
end
