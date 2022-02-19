class CollabsController < ApplicationController
  before_action :set_collab, only: %i[update destroy confirm deny]
  before_action :set_project, only: %i[create edit destroy]
  before_action :authenticate_user!

  def new
    @collab = Collab.new
    authorize @collab
  end

  def create
    @collab = Collab.new(collab_params)
    @collab.project = @project
    @collab.user = current_user
    authorize @collab
    redirect_to dashboard_path
    if @collab.save
      flash[:notice] = "You submitted a request to join the project #{@project.title}."
    else
      flash[:notice] = "You need to enter a message to apply."
    end
  end

  def edit
    @collab = Collab.find(params[:id])
    authorize @collab
  end

  def update
    authorize @collab
    if @collab.update(collab_params)
      redirect_to project_path(@collab.project)
      flash[:notice] = "Collab was edited"
    else
      render :edit
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    @collab.destroy
    authorize @collab
    redirect_to session.delete(:return_to)
  end

  def confirm
    session[:return_to] ||= request.referer
    @collab.status = "confirmed"
    @collab.confirmed = true
    flash[:notice] = "Collab was accepted"
    authorize @collab
    @collab.save
    redirect_to session.delete(:return_to)
  end

  def deny
    session[:return_to] ||= request.referer
    @collab.status = "denied"
    @collab.confirmed = false
    flash[:notice] = "Collab was denied"
    authorize @collab
    @collab.save
    redirect_to session.delete(:return_to)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_collab
    @collab = Collab.find(params[:id])
  end

  def collab_params
    params.require(:collab).permit(:project_id, :user_id, :status, :role, :message, :created_at, :updated_at, :confirmed)
  end
end
