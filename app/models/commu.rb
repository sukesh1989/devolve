class Commu < ActiveRecord::Base
  belongs_to :user
  mount_uploader :commuimage,ImageUploader
   has_many :posts
   
    has_many :memberships
    validates :name, :presence => true, :length => { :maximum => 20 }
end
