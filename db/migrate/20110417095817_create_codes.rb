class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|

       t.integer :user_id
       t.text :content
       t.timestamps
    end
    
    add_index :codes, :user_id
  end

  def self.down
    drop_table :codes
  end
end
