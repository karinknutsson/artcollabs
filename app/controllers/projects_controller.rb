class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = current_user.project.new(project_params)
    authorize @project
    respond_to do |format|
      if @song_text.save
        format.html { redirect_to @song_text, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
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

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:user_id, :title, :description, :status, :budget, :max_members, :start_date, :end_date)
  end
end
