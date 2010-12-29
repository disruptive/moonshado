class MessagesController < ApplicationController
  
  before_filter :get_message, :only => [:show, :edit, :update, :delete]
  
  def index
    @message = Message.find(:all, :limit => 24)
  end
  
  def new
    @message = Message.new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def delete
  end
  
  private
  
  def get_message
    if params[:id]
      @message = Message.find(params[:id])
    end
    if @message.nil?
      redirect_to 'index'
    end
  end
  
end