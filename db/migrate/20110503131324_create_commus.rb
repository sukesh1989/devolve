class CreateCommus < ActiveRecord::Migration
  def self.up
    create_table :commus do |t|
      t.string   :name, :limit => 20
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :commus
  end
end
