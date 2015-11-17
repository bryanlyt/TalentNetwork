class MessagesController < ApplicationController
  before_action :authenticate_user!

	def new
    raise 'No Recipient Selected' unless params[:to]
  	@recipient = User.find_by(id: params[:to].to_i).id
  end

  def create
    recipients = User.where(id: params['recipient'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
