class Comment < ActiveRecord::Base
  belongs_to :post
   validates :title, :presence => true, :length => { :maximum => 30 }
    validates :body, :presence => true
end
