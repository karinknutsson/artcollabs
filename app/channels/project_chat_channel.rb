class ProjectChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    project_chat = ProjectChat.find(params[:id])
    stream_for project_chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
