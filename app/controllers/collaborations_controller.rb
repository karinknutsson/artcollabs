class CollaborationsController < ApplicationController
  before_action :set_collaboration, only %i[ create edit update destroy ]
  before_action :authenticate_user!
  def new
    @collaboration = current_user.collaboration.new
    authorize @collaboration
  end

  def create
    @collaboration = current_user.collaboration.new(collaboration_params)
    authorize @collaboration
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
