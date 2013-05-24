class MessagesController < ApplicationController

  respond_to :html, :json

  def index
    @messages = Message.all
    respond_with @messages
  end

  def show
    @message = Message.find(params[:id])
    respond_with @messages
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.create!(user_id: Random.new.rand(1..User.count), texte: params[:message][:texte])
    respond_with @messages
  end

  def update
    @message = Message.find(params[:id])
    @message.update_attributes(params[:message])
    respond_with @messages
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with @messages
  end
end
