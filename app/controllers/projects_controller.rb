class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  def show
    # ✅
    @collaboration = Collaboration.new
    @milestone = Milestone.new
    @milestones = Milestone.where(project_id: @project)
    authorize @project
  end

  def index
    sql_query = "title ILIKE :query OR budget ILIKE :query OR location ILIKE :query"
    if params[:query].present?
      @projects = policy_scope(Project.where(sql_query, query: "%#{params[:query]}%")).order(created_at: :desc)
    else
      @projects = policy_scope(Project).order(created_at: :desc)
    end
  end

  def new
    # ✅
    @project = Project.new
    authorize @project
  end

  def create
    # ✅
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to @project
      flash[:notice] = " New project: \n #{@project.title} was created"
    else
      render :new
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to @project
      flash[:notice] = " \n #{@project.title} was edited"
    else
      render :edit
    end
  end

  def destroy
    raise
    authorize @project
    @project.destroy
    redirect_to root_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:user_id, :title, :description, :status, :budget, :max_members, :start_date, :end_date)
  end
end
