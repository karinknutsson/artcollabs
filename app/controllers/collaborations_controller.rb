class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[ update destroy ]
  before_action :authenticate_user!
  
  def new
  end

  def create 
    # ✅
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

  # ✅
  def edit 
    @project = Project.find(params[:project_id])
    @collaboration = Collaboration.find(params[:id])
    authorize @collaboration

  end

  def update
    authorize @collaboration
    if @collaboration.update(collaboration_params)
      redirect_to project_path(@collaboration.project)
      flash[:notice] = " Collaboration was edited"
    else
      render :edit
    end
  end

  def destroy
    @collaboration.destroy
    authorize @collaboration
  end

  def confirm
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.confirmed == true
      @collaboration.confirmed = false
      flash[:notice] = "Collaboration was denied"
    else
      @collaboration.confirmed = true
      flash[:notice] = "Collaboration was accepted"
    end
    
    authorize @collaboration
    @collaboration.save
    
    # redirect_to project_path(@collaboration.project)

    # ON THE PAGE WHERE THE CONFIRMATION IS GOING TO HAPPEN (got from wignb) >>>
    # <% if booking.confirmed == nil %> 
    # <%= link_to  "Confirm", confirm_path(booking), method: :patch, data: { confirm: "Are you sure?" }, class: "btn btn-success text-right" %>
    # <%= link_to  "  Deny  ", confirm_path(booking), method: :patch, data: { confirm: "Are you sure?" }, class: "btn btn-danger text-right" %>

  end

  private

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end
  
  def collaboration_params
    params.require(:collaboration).permit(:project_id, :user_id, :status, :role, :message, :created_at, :updated_at)
  end
end
