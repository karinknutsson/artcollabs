class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  
  def new
    # 
  end

  def create 
    # ❌
    @collaboration = Collaboration.new(collaboration_params)
    # How to get project ID?
    @project = Project.find(params[:project_id])
    @collaboration.project = @project
    @collaboration.user = current_user
    authorize @collaboration
    # respond_to do |format|
      if @collaboration.save
        redirect_to @project
        flash[:notice] = "You submitted a request to collaborate for the project #{@project.title}. Now go create something while you wait for approval!"
      else
        render :new

      end
    # end
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
