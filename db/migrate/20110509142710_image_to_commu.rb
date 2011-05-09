class ImageToCommu < ActiveRecord::Migration
  def self.up
    add_column :commus, :commuimage, :string
  end

  def self.down
  end
end
