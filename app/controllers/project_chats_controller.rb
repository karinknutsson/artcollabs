class ProjectChatsController < ApplicationController
  def show
    @project_chat = ProjectChat.find(params[:id])
    @project = @project_chat.project
    @message = Message.new
    authorize @project_chat
  end
end
