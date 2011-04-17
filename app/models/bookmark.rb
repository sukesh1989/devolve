class Bookmark < ActiveRecord::Base
  belongs_to :user
  
  
  validates :title, :presence => true, :length => { :maximum => 100 }

   validates :url, :presence => true,:format=> {:with=>/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }
  
   default_scope :order => 'bookmarks.created_at DESC'
end
