class Post < ActiveRecord::Base
  belongs_to :commu
  has_many :comments
end
