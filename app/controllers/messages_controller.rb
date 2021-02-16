class MessagesController < ApplicationController
  def create
    raise
    @project_chat = ProjectChat.find(params[:project_chat_id])
    @message = Message.new(message_params)
    @message.project_chat = @project_chat
    @message.user = current_user
    if @message.save
      ProjectChatChannel.broadcast_to(
        @project_chat,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to project_chat_path(@project_chat, anchor: "message-#{@message.id}")
    else
      render "project_chat/show"
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
