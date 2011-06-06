  class MessagesController < ApplicationController
    
    unloadable
  
    before_filter :get_message, :only => [:show, :delete]
    before_filter :check_hash, :only => [ :report, :receive ]
  
    def index
      @inbound = Message.inbound.unread
      @outbound = Message.outbound
      render :template => "/moonshado/messages/index"
    end
  
    def new
      @message = Message.new
      render :template => "/moonshado/messages/new"
    end
  
    def create
      @message = Message.new(params[:message].merge({:from => Moonshado::SMS_API_CONFIG[:short_code]}))
      result = @message.save && @message.deliver! ? "Message sent." : "Message could not be sent."
      redirect_to message_path(@message.id), :notice => result
    end
  
    def show
      render :template => "/moonshado/messages/show"
    end
  
    def delete
      @message.destroy
      redirect_to messages_path, :notice => "Message deleted."
    end
    
    # carrier, device_address, message_subid - starting with 0, status_code, status_info, update_date, country
    def report
    end

    def receive
      @message = Message.new(
        :carrier      => params[:carrier],
        :from         => params[:device_address],
        :to           => params[:inbound_address],
        :country      => params[:country],
        :body         => params[:message],
        :timestamp    => params[:timestamp]
      )
      if @message.save
        head :created, :location => message_path(@message)
      end
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
    
    def check_hash
      params[:hash] == Moonshado::Base.client_hash
    end
  
  end

