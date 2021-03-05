class MessagesController < ApplicationController
  def create
     # Gets current page to redirect later
     session[:return_to] ||= request.referer

    @project_chat = ProjectChat.find(params[:project_chat_id])
    @message = Message.new(message_params)
    @message.project_chat = @project_chat
    @message.user = current_user
    if @message.save
      ProjectChatChannel.broadcast_to(
        @project_chat,
        render_to_string(partial: "message", locals: { message: @message })
      )

    else
      # Redirects to previous page
      redirect_to session.delete(:return_to)
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
