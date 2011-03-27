class AddGettingStartedToUser < ActiveRecord::Migration
  def self.up
     add_column :users, :getting_started, :boolean,:default=>true
  end

  def self.down
  end
end
