class Post < ActiveRecord::Base
  belongs_to :commu
  has_many :comments
    default_scope :order => 'posts.created_at DESC'
end
