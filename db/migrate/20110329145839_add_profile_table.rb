class AddProfileTable < ActiveRecord::Migration
  def self.up
       create_table :profiles do |t|
         t.column :user_id, :integer, :null => false
            t.column :name, :string            
            t.column :birthdate, :date
            t.column :location, :string
            t.column :bio, :text
            t.column :occupation, :string              
            t.column :gender, :string
         t.timestamps
       
     end

     def self.down
       drop_table :profiles
     end
  end

  def self.down
  end
end
