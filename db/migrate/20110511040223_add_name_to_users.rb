class AddNameToUsers < ActiveRecord::Migration
  def self.up
    
      add_column :users, :name, :string,:default=>"sukesh"
  end

  def self.down
  end
end
