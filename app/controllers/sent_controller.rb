class SentController < ApplicationController
  
  before_filter :authenticate_user!
  layout 'mail'
  def index
     @messages = current_user.sentmessages.paginate :per_page => 10, :page => params[:page], :order => "created_at DESC"
   end

   def show
     @message = Sentmessage.find(params[:id])
   end

   def new
     @message = current_user.sent_messages.build
     
   end

   def create
     
     @message = current_user.sent_messages.build(params[:message])
  
     if @message.save
      
       
      
       flash[:notice] = "Message sent"
       
      
       redirect_to :action => "index"
     else
       render :action => "new"
     end
   end
   
   def delete
     @message =params[:id]
     
      Sentmessage.remove_message(@message)
       redirect_to   sent_index_path+'/'+current_user.id.to_s
     
   end


end
