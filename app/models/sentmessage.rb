class Sentmessage < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
    belongs_to :recipient, :class_name => "User"
    belongs_to :folder
    
    
    def self.remove_message(message_to_delete)
       transaction do
            
            destroy(find_by_id(message_to_delete))
            
           

          end
        end
end
