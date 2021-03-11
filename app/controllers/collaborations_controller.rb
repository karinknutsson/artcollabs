class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[update destroy confirm deny]
  before_action :set_project, only: %i[create edit destroy]
  before_action :authenticate_user!
  before_action :set_previous_page, only: %i[destroy confirm deny]

  def new
    @collaboration = Collaboration.new
    authorize @collaboration
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.project = @project
    @collaboration.user = current_user
    authorize @collaboration
    create_logic
  end

  def edit
    @collaboration = Collaboration.find(params[:id])
    authorize @collaboration
  end

  def update
    authorize @collaboration
    if @collaboration.update(collaboration_params)
      redirect_to project_path(@collaboration.project)
      flash[:notice] = " Collaboration was edited."
    else
      render :edit
    end
  end

  def destroy
    @collaboration.destroy
    authorize @collaboration
    redirect_to session.delete(:return_to)
  end

  def confirm
    @collaboration.status = "confirmed"
    @collaboration.confirmed = true
    flash[:notice] = "Collaboration was accepted."
    authorize @collaboration
    @collaboration.save
    redirect_to session.delete(:return_to)
  end

  def deny
    @collaboration.status = "denied"
    @collaboration.confirmed = false
    flash[:notice] = "Collaboration was denied."
    authorize @collaboration
    @collaboration.save
    redirect_to session.delete(:return_to)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end

  def collaboration_params
    params.require(:collaboration).permit(:project_id, :user_id, :status,
                                          :role, :message, :created_at, :updated_at,
                                          :confirmed)
  end

  def set_previous_page
    session[:return_to] ||= request.referer
  end

  def create_logic
    if @collaboration.save
      flash[:notice] = "You submitted a request to collaborate for the project #{@project.title}."
    else
      flash[:notice] = "You have to enter a message to apply."
    end
    redirect_to @project
  end
end
