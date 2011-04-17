class AddBookmarks < ActiveRecord::Migration
   def self.up
      create_table :bookmarks do |t|

                t.integer :user_id
               t.string :url
               t.string :title
               t.text :description          
        t.timestamps
      end
      add_index :bookmarks, :user_id
    end

    def self.down
      drop_table :bookmarks
    end
  end
  