class SentController < ApplicationController
  layout 'mail'
  def index
     @messages = current_user.sent_messages.paginate :per_page => 10, :page => params[:page], :order => "created_at DESC"
   end

   def show
     @messages = Sentmessage.find(:all,:conditions=>{:message_id=>params[:id]})
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
     @message = current_user.sent_messages.find(params[:id])
     
      Message.remove_message(@message)
       redirect_to   sent_index_path+'/'+current_user.id.to_s
     
   end


end
