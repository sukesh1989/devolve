class MessagesController < ApplicationController
   layout 'mail'
  def show
      @message = current_user.received_messages.find(params[:id])
    end
    
    
    def destroy
      @message = current_user.received_messages.find(params[:id])
      @message.update_attribute("deleted", true)
      redirect_to mailbox_inbox_path
    end

    def undelete
      @message = current_user.received_messages.find(params[:id])
      @message.update_attribute("deleted", false)
      redirect_to mailbox_inbox_path
    end
    
    def reply
      @original = current_user.received_messages.find(params[:id])
      subject = @original.subject.sub(/^(Re: )?/, "Re: ")
      body = @original.body.gsub(/^/, "> ")
      @message = current_user.sent_messages.build(:to => [@original.author.id], :subject => subject, :body => body)
      render :template => "sent/new_reply"
    end
    def forward
        @original = current_user.received_messages.find(params[:id])

        subject = @original.subject.sub(/^(Fwd: )?/, "Fwd: ")
        body = @original.body.gsub(/^/, "> ")
        @message = current_user.sent_messages.build(:subject => subject, :body => body)
        render :template => "sent/new"
      end
      def delete_from_trash
         @message = current_user.received_messages.find(params[:id])
        
         MessageCopy.remove_message(@message)
          redirect_to  mailbox_trash_path+'/'+current_user.id.to_s 
      end
    

end
