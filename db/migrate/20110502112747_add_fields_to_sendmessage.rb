class AddFieldsToSendmessage < ActiveRecord::Migration
  def self.up
   add_column :sentmessages, :message_id, :integer
  end

  def self.down
  end
end
