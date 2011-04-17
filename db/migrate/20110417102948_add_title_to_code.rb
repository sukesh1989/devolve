class AddTitleToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :title, :string
    add_column :codes, :langauge, :string
    
    add_column :codes, :description, :text
  end

  def self.down
  end
end
