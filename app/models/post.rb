class Post < ActiveRecord::Base
  belongs_to :commu
  has_many :comments
    default_scope :order => 'posts.created_at DESC'
    validates :title, :presence => true, :length => { :maximum => 30 }
    validates :body, :presence => true
end
