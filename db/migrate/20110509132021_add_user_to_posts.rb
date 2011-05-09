class AddUserToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
  end

  def self.down
  end
end
