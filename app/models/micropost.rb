class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true 
  default_scope :order => 'microposts.created_at DESC'
  
  
  
  def self.from_users_followed_by(user)
    followed_ids = user.friends.map(&:id).join(", ")
    if  followed_ids.length==0
      followed_ids=["#{user.id}"]
      
    end
    where("user_id IN (#{followed_ids}) OR user_id = :user_id", { :user_id => user })
  end
end
