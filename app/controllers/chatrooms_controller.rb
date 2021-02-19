class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @direct_message = DirectMessage.new
    authorize @chatroom
  end
end
