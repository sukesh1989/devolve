class AddDelete < ActiveRecord::Migration
  def self.up
      add_column :message_copies, :deleted, :integer
    end

    def self.down
      remove_column :message_copies, :deleted
    end
end
