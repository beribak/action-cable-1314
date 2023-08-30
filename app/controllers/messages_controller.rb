class MessagesController < ApplicationController
  def create  
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.user = current_user
    @message.chatroom = @chatroom

    if @message.save
      # redirect_to chatroom_path(@chatroom)
      ChatroomChannel.broadcast_to(
        "danko#{@chatroom.id}",
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else  
      render "chatrooms/show"
    end
  end

  private 

  def message_params  
    params.require(:message).permit(:content)
  end
end
