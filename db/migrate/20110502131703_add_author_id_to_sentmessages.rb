class AddAuthorIdToSentmessages < ActiveRecord::Migration
  def self.up
       add_column :sentmessages, :user_id, :integer
  end

  def self.down
  end
end
