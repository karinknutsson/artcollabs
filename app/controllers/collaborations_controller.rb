class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  
  def new
    # 
  end

  def create 
    # ❌
    @collaboration = Collaboration.new(collaboration_params)
    @project = Project.find(params[:project_id])
    @collaboration.project = @project
    @collaboration.user = current_user
    authorize @collaboration
      if @collaboration.save
        redirect_to @project
        flash[:notice] = "You submitted a request to collaborate for the project #{@project.title}. Now go create something while you wait for approval!"
      else
        render :new
      end
  end

  def edit
    authorize @collaboration
  end

  def update
    authorize @collaboration
  end

  def destroy
    authorize @collaboration
  end

  private

  def set_collaboration
    @collaboration = @collaboration.find(params[:id])
  end
  
  def collaboration_params
    params.require(:collaboration).permit(:project_id, :user_id, :status, :role)
  end
end
