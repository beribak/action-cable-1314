class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    @chatroom_id = params[:id]
    stream_from "chatroom:danko#{@chatroom_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
