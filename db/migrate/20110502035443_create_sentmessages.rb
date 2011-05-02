class CreateSentmessages < ActiveRecord::Migration
  def self.up
    create_table :sentmessages do |t|
      t.integer :recipient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sentmessages
  end
end
