class MessagesController < ApplicationController
  before_action :set_group
  before_action :move_to_index

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user).order("created_at DESC")
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      @messages = @group.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
