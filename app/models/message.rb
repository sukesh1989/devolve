class Message < ActiveRecord::Base
   before_create :prepare_copies
  
  belongs_to :author, :class_name => "User"
   has_many :message_copies
   has_many :sentmessages
   has_many :recipients, :through => :message_copies
  
   attr_accessor  :to ,:recipient_id,:friend_tokens
   attr_accessible :subject, :body, :to,:recipient_id
attr_reader :friend_tokens

   def prepare_copies
      to.each do |recipient|
        
       recipient = User.find(recipient)
       sentmessages.build(:recipient_id=>recipient.id,:subject=>subject,:body=>body,:user_id=>author_id)
       message_copies.build(:recipient_id => recipient.id, :folder_id => recipient.inbox.id,:deleted=>'false')
     end
  end
  def self.remove_message(message_to_delete)
     transaction do
          message_to_delete.destroy
         
        end
      end
end
