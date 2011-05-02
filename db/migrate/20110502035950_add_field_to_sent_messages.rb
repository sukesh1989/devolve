class AddFieldToSentMessages < ActiveRecord::Migration
  def self.up
    
        add_column :sentmessages, :subject, :string
        
            add_column :sentmessages, :body, :text
            
     
  end

  def self.down
  end
end
