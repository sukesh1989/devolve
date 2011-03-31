class AddImageToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :image, :string
  end

  def self.down
    remove_column :profiles, :image
  end
end
